from pwn import *
context.update(log_level='debug')


def new(idx, size, data):
    p.sendlineafter('>', '1')
    p.sendlineafter(':', str(idx))
    p.sendlineafter(':', str(size))
    p.sendlineafter(':', data)
def show(idx):
    p.sendlineafter('>', '2')
    p.sendlineafter(':', str(idx))
    p.recvuntil('data: ')
    _recv = p.recvline()
def delete(idx):
    p.sendlineafter('>', '3')
    p.sendlineafter(':', str(idx))

p = process('chall')

p.sendlineafter('n:', '99')

new(0,30, 'a'*29)

p.interactive()


