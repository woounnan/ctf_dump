s="""AC F3 0C 25 A3 10 B7 25 16 C6 B7 BC 07 25 02 D5 C6 11 07 C5""".split(" ")

s = [ int(x, 16) for x in s]

import string
ascii_table = string.letters + string.digits + '[]{};\':",.,.//!@#$%^&*()_-+=?/'
flag = ''
for se in s:
	#print 's: ' + hex(se)
	for c in ascii_table:
		tp = (ord(c) * 0xfb) & 0xff
		if tp == se:
			flag += c
print flag
	

