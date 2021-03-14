from pwn import *

context.update(log_level='debug')
p = remote('basics.2020.ctfcompetition.com', 1337)

p.recvrepeat(1)
p.sendline()

p.interactive()
