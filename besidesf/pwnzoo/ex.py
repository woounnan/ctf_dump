from pwn import *
size_name = 0x24

def Change(name):
	p.sendlineafter(' Exit', '2')	
	p.sendline(name)

p = process('pwnzoo')
p.sendlineafter('dog? ', 'd')
p.sendline('a')

