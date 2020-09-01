serial = """49 60 67 74 63 67 42 66 80 78 69 69 7B 99 6D 88
68 94 9F 8D 4D A5 9D 45""".replace('\n', ' ').split(' ')

flag = ''
i = 0
for x in serial:
    flag += chr((int(x, 16) - i*2) ^ i)
    i += 1 
print flag
    
