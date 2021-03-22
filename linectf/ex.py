from pwn import *
import os

print os
context.update(log_level='debug')
p = remote('35.194.97.194', 10000)
p.sendline()
p.interactive()
