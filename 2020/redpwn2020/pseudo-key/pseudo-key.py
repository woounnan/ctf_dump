#!/usr/bin/env python3

from string import ascii_lowercase

chr_to_num = {c: i for i, c in enumerate(ascii_lowercase)}
num_to_chr = {i: c for i, c in enumerate(ascii_lowercase)}

f = open('enc.txt', 'r')

data = f.readlines()
enc_key = data[1].split(': ')[1].replace('\n', '')
enc_flag = data[0].split(': ')[1].replace('\n', '')
key = ''

for x in enc_key:
    num = chr_to_num[x]/2
    print('num: ' + str(num))
    if num < 13:
        key += num_to_chr[num/2]
    else:
        key += num_to_chr[(num+26)/2]

print('key: ' + key)
flag = ''
print('enc_flag: ' + enc_flag)

for i in range(len(enc_flag)):
    if enc_flag[i] == '_':
        flag+= '_'
        continue
    x = chr_to_num[enc_flag[i]]
    y = chr_to_num[key[i%len(key)]]
    res = x-y
    if res < 0:
        flag += num_to_chr[x+26-y]
    else:
        flag += num_to_chr[x-y]
        



print('flag: ' + flag)

