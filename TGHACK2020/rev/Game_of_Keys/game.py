# uncompyle6 version 3.6.5
# Python bytecode 3.7 (3394)
# Decompiled from: Python 2.7.17 (default, Jan 19 2020, 19:54:54) 
# [GCC 9.2.1 20200110]
# Warning: this version has problems handling the Python 3 byte type in contants properly.

# Embedded file name: keygame.py
# Size of source mod 2**32: 1496 bytes
import base64
from itertools import cycle
import tqdm

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
        words = []
        with open('wordlist.txt') as (f):
            for line in f:
                words.append(line.strip())

            for i in range(self.x):
                for j in range(self.y):
                    self.matrix[j][i] = words[(i + j)]
    def make_keys(self, *args):
        key = self.matrix[args[0]/25][args[0]%25]
        key = key.strip()
        #print(key)
        return key

    def checkdata(self, key):
        f = base64.b64decode('NSYDUhoVWQ8SQVcOAAYRFQkORA4FQVMDQQ5fQhUEWUYMDl4MHA==');
        data = f.decode('ascii')
        c = ''.join((chr(ord(c) ^ ord(k)) for c, k in zip(data, cycle(key))))
        return ('%s ^ %s = %s' % (data, key, c))


if __name__ == '__main__':
    mgame = myGame(25, 25)
    flags = []
    for x in range(625):
        for y in range(625):
            data = mgame.make_keys(x)
            data2 = mgame.make_keys(y)
            res = mgame.checkdata(data)
            if res.find('TG20{') != -1:
                print 'x: ' + str(x)
                print 'y: ' + str(y)
                print 'key: ' + data + ' :: ' + data2 
                raw_input('found flag : ' + str(res))
                flags.append(res)


    #print 'result: ' + str(flags) 
# okay decompiling keygame.pyc
