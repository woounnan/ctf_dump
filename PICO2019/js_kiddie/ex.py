from PIL import Image
import io
import requests
import itertools

res = requests.get('http://2019shell1.picoctf.com:57738/bytes')
data = res.text.split(' ')

expected = '89 50 4E 47 0D 0A 1A 0A 00 00 00 0D 49 48 44 52'.split(' ')

len_round = 16
key = []

result = [0 for x in range(len(data))]
def decPNG(key, idx):
    for i in  range(len_round):
        shifter = key[i]
        for j in  range(len(data) // len_round):
            result[(j * len_round) + i] = int(data[(((j + shifter) * len_round) % len(data)) + i], 10)
    n = 'flag{}.png'.format(idx)
    try:
        img = Image.open(io.BytesIO(bytes(result)))
        img.save(n)
        print ("Create png successfully [{}]".format(n))
    except IOError:
        print ("Failed to create png [{}]".format(n))


def getKey():
    for i in range(len_round):
        k = []
        for shifter in range(10):
            result = data[((shifter * len_round) % len(data)) + i]
            if int(result, 10) == int(expected[i], 16):
                k.append(shifter)
        key.append(k)


getKey()

i = 0
for p in itertools.product(*key):
    decPNG(p, i)
    i += 1
    






