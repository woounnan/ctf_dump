import base64
import codecs

enc = "=ZkXipjPiLIXRpIYTpQHpjSQkxIIFbQCK1FR3DuJZxtPAtkR"
enc = enc[::-1]
print 'enc : ' + enc
enc = codecs.decode(enc, 'rot_13')
print 'enc : ' + enc
enc = base64.b64decode(enc,  altchars=None)
#enc = bytes.decode('utf-16', enc)
key = "nyameowpurrpurrnyanyapurrpurrnyanya"
key = codecs.encode(key, 'rot_13')


dec = bytearray(map(lambda x,y : chr(ord(x) ^ ord(y)), list(enc), list(key)))
print dec

