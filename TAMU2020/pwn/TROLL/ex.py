from pwn import *
import time
import re






p = None
while True:
	p_gen = process('gen')
	p = remote('challenges.tamuctf.com', 4765)
	ts = int(time.time())
	recv = p_gen.recvall()
	p_gen.close()
	pt = re.compile('\[[a-z0-9]*\]')
	res = pt.findall(recv)
	pt = re.compile('[0-9]+')
	res = pt.findall(res[0])
	res = res[0]



	print "timestamp for generating a key: " + res
	print "timestamp now: " + str(ts)

	if str(ts) != res:
		print "timestamp mismatched"
		p.close()
		continue
	else:
		break



print p.recvuntil('Who goes there?')
p.sendline('woou')

keys = []
with open('keys', 'r') as f:
	strs = ''.join(f.readlines())
	keys = strs.split(';')

for x in range(len(keys)-1):
	print p.recvuntil('What is it?')
	p.sendline(keys[x])
	
p.interactive()




	


