from pwn import *
import re
import time

table_ascii = 'abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ1234567890_+-={}[];\':",./<>?!@#$%^&*()'

key = """
A...P...R...M...
X...C...S...B...
C...E...D...I...
S...B...V...X...
I...S...X...W...
E...R...J...R...
W...S...Z...A...
R...S...Q...????
"""
pt = re.compile('[A-Z]')

temp1 = bytearray(pt.findall(key))[0::2]
print 'key: ' + temp1

key = bytearray(pt.findall(key))[0::2][::-1]
print 'key: ' + key
#key = bytearray(list("QRZWJEXIVSDCSXRA"))




def dec(ch):
    #print 'ch: ' + str(ch) + ' & ' + chr(ch)
    if ch == 32:
        return ch
    else:
        for x in table_ascii:
            if ((ord(x) - 65) * 17 + 12) % 26 + 65 == ch:
                return x
def enc(ch):
    if ch == 32:
        return ch
    else:
        return ((ch - 65) * 17 + 12) % 26 + 65


answer = bytearray(map(dec, list(key)))
print 'answer : ' + answer

'''
p = remote('challenges.auctf.com', 30005)

time.sleep(1)
print p.recvrepeat(0.2)

p.send(answer)


p.interactive()
'''




        
        

    
        






