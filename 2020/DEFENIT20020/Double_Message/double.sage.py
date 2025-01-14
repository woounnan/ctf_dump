from Crypto.PublicKey import RSA
from hashlib import md5
import binascii

nBitSize = 2048
e = 3
Flag = b'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'   # censored

key = RSA.generate(nBitSize)
print key.n

M1 = Flag + md5(Flag).digest()
M2 = Flag + md5(b'One more time!' + Flag).digest()
print 'M1: ' + M1

hexli = binascii.hexlify(M1)
hexli2 = binascii.hexlify(M2)
print 'hex: ' + str(hexli)
print 'hex2: ' + str(hexli2)
M1 = int(hexli,16)
M2 = int(hexli2,16)

C1 = Integer(pow(M1,e,key.n))
C2 = Integer(pow(M2,e,key.n))

with open('out.txt','w') as f:
    f.write('n = ' + hex(key.n)+'\n')
    f.write('C1 = '+ hex(C1)+'\n')
    f.write('C2 = ' + hex(C2)+'\n')
