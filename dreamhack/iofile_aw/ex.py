from pwn import *

p = process('iofile_aw')
payload = 
p.sendlineafter('# ', 'printf ' + payload)
