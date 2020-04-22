# uncompyle6 version 3.6.5
# Python bytecode 3.7 (3394)
# Decompiled from: Python 2.7.17 (default, Jan 19 2020, 19:54:54) 
# [GCC 9.2.1 20200110]
# Warning: this version has problems handling the Python 3 byte type in contants properly.

# Embedded file name: keygame.py
# Size of source mod 2**32: 1496 bytes
import base64
from itertools import cycle

class myGame:

    def __init__(self, xdim=4, ydim=4):
        self.x = xdim
        self.y = ydim
        self.matrix = []
        for i in range(self.x):
            row = []
            for j in range(self.y):
                row.append(0)

            self.matrix.append(row)

    def make_keys(self, *args, **kwargs):
        words = []
        with open('wordlist.txt') as (f):
            for line in f:
                words.append(line.strip())

            for i in range(self.x):
                for j in range(self.y):
                    self.matrix[j][i] = words[(i + j)]
        keyArray = []
        keyArray.append(self.matrix[args[0]][args[1]])
        keyArray.append(self.matrix[args[2]][args[3]])
        key = ''
        for k in keyArray:
            key = key.strip() + str(k).strip()
        print(len(key))
        return key

    def checkdata(self, key):
        f = base64.b64decode('NSYDUhoVWQ8SQVcOAAYRFQkORA4FQVMDQQ5fQhUEWUYMDl4MHA==')
        data = f.decode('ascii')
        c = ''.join((chr(ord(c) ^ ord(k)) for c, k in zip(data, cycle(key))))
        print c

    def getKey(self, plain):
        f = base64.b64decode('NSYDUhoVWQ8SQVcOAAYRFQkORA4FQVMDQQ5fQhUEWUYMDl4MHA==')
        data = f.decode('ascii')
        c = ''.join((chr(ord(c) ^ ord(k)) for c, k in zip(data, cycle(plain))))
        print c
        


if __name__ == '__main__':
    mgame = myGame(25, 25)
    strs = 'TG20{this'
    mgame.getKey(strs[:8])
    mgame.checkdata('aa1baa1fF'[:8])
    #mgame.checkdata(data)
# okay decompiling keygame.pyc
