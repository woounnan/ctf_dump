from pwn import *

context.update(arch='amd64', os='linux', log_level='debug')


p = remote('p1.tjctf.org', 8003)


import re
pt = re.compile('[0-9]+ \+ [0-9]+')
_recv = p.recvrepeat(1)

mt = pt.findall(_recv)

p.sendline(str(eval(mt[0])))

p.interactive()






