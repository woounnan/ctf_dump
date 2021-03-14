import io

_data = open('data', 'r').read().split(',')
_data2 = ' '.join(_data).replace('0x', '').replace('\n','')

xorkey = '1a 36 1e 06 05 05 0c 10 1b 0c 1e 06 05 0f 07 1c'
xorkey = bytearray.fromhex(xorkey)

low = bytearray.fromhex(_data2)

for idx in range(len(low)):
    #print 'data: ' + hex(low[idx])
    low[idx] = low[idx] ^ xorkey[idx%len(xorkey)]
    '''
    print 'xorkey: ' + hex(xorkey[idx%len(xorkey)])
    print 'dater after that: ' + hex(low[idx])
    print '-----------'
    raw_input()
    '''

f = open('ascii.txt', 'w')
f.write(low)
f.close() 
