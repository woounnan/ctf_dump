from pwn import *

table_ascii = 'abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ1234567890_+-={}[];\':",./<>?!@#$%^&*()'
secret = 'aQLpavpKQcCVpfcg'


def dec(ch):
    global table_ascii
    for x in table_ascii:
        calc = (ord(x) * 8 + 19) % 61 + 65
        if ord(ch) == calc:
            return x

            
#calc dec
serial = bytearray(map(dec, list(secret)))


print 'serial is ['+serial+']'
        
p = remote('challenges.auctf.com', 30004)

print p.recvrepeat(0.2)


p.sendline(serial)


p.interactive()

