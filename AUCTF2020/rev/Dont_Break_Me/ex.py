from pwn import *
import re
import time

table_ascii = 'abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ1234567890_+-={}[];\':",./<>?!@#$%^&*()'

key = """
X...A...P...R...M...
X...C...S...B...
C...E...D...I...
S...B...V...X...
I...S...X...W...
E...R...J...R...
W...S...Z...A...
R...S...Q...????
"""
pt = re.compile('[A-Z]')

key = bytearray(pt.findall(key))[0::2][::-1]

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
