from itertools import cycle

f = open('flag', 'w')
s = 'dh{'
l = 0x40 - len(s) - 2
print hex(l)
s += ('1234567890'*(l/10 + 1))[:-(10 - l%10)] + '}'
print hex(len(s))
f.write(s)
f.close()

