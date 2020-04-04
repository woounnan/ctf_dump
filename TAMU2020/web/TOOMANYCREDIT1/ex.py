import os

f = open('check', 'r')

r = ''.join(f.readlines())
pt = r[-6:]

r = r.replace(pt, '\xff\xff\xff\xff\xff\xff')

fw = open('payload', 'wb')
fw.write(r)
fw.close()
