from pwn import *
context.update(log_level = 'debug')
p = process('/work/ctf/dreamhack/iofile_aw/test')
raw_input('debug:' + str(p.pid))
p.recvrepeat(0.5)
p.interactive()
