import re

pt = re.compile('\?sort=.+username,0x3a,password.+\%20(\d{1,2}),1\)\)=(\d{2,3}).+500')

f = open('access.log')
data = f.read()
m = pt.findall(data)
res = [0]*len(m)
for idx, value in m:
    res[int(idx)-1] = int(value)
res = bytearray(res)
print(res)
