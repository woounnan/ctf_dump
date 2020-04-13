import tqdm

enc = "\x71\x11\x24\x59\x8d\x6d\x71\x11\x35\x16\x8c\x6d\x71\x0d\x39\x47\x1f\x36\xf1\x2f\x39\x36\x8e\x3c\x4b\x39\x35\x12\x87\x7c\xa3\x10\x74\x58\x16\xc7\x71\x56\x68\x51\x2c\x8c\x73\x45\x32\x5b\x8c\x2a\xf1\x2f\x3f\x57\x6e\x04\x3d\x16\x75\x67\x16\x4f\x6d\x1c\x6e\x40\x01\x36\x93\x59\x33\x56\x04\x3e\x7b\x3a\x70\x50\x16\x04\x3d\x18\x73\x37\xac\x24\xe1\x56\x62\x5b\x8c\x2a\xf1\x45\x7f\x86\x07\x3e\x63\x47";
table_ascii = ' abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ1234567890!@#$%^&*()-=_+[]{};\',./<>?'
arr_flag = [];
def _(x, y):
    return x ^ y;

def calc(y):
    z = 0;
    for  i in range(8 - y, 8):
        z += pow(2, i);
    return z
def calc2(x, y):
    y = y % 8;
    c = calc(y);
    c = (x & c) >> (8 - y);
    return ((c) + (x << y)) & 0x00ff;

def _calc2(x, y):
    return calc2(x, y)

def encrypt(str_enc, key):
    str_res = "";
    str_unknown = "";
    for i in range(len(str_enc)):
        c = ord(str_enc[i]);
        if i != 0:
            t = ord(str_res[i - 1])% 2;
            if t == 0:
                    cr = _(c, ord(key[i % len(key)]));
            elif t == 1:
                    cr = _calc2(c, ord(key[i % len(key)]));
        else:
            cr = _(c, ord(key[i % len(key)]));
        str_res += chr(cr);
    return str_res;

def getFlag(key):
    r = 0;
    for i in range(len(key)):
        r += ord(key[i])
    if r == 8932:
        import re
        pt = re.compile('[a-zA-Z0-9\s\t!@#$%^&*\(])-=_+\[\]\{\}]')
        for x in key:
            if not(x in table_ascii):
                return -1
        raw_input('key: ' + str(key))
        return str(key)
    else:
        return -1

 
from itertools import product 
chars = table_ascii
for length in tqdm.tqdm(range(1, 10)): 
	to_attempt = product(chars, repeat=length) 
	for attempt in to_attempt: 
		brute = ''.join(attempt) 
                ret = getFlag(encrypt(enc, brute)); 
                if ret != -1:
                    print 'found flag: ' + str(ret)
                    raw_input('key: ' + str(bruteforce))
                    arr_flag.append(ret)

print 'Worked successfuly!!'
print 'flag : ' + str(arr_flag)
