
f = open('cipher.txt', 'r')
data = f.read()
flag = 'test'

for i in range(30):
    flag = data.decode('base64')
print flag
    
    
