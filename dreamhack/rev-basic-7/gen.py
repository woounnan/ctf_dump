serial = """52 DF B3 60 F1 8B 1C B5 57 D1 9F 38 4B 29 D9 26 7F C9 A3 E9 53 18 4F B8 6A CB 87 58 5B 39 1E""".split(' ')

def rotr(num, bits):
    bits = bits % 8
    for x in range(bits):
        bit = num & 1
        num >>= 1
        if(bit):
            num |= (1 << 7)
    return num

print rotr(10, 11)
serial = [ int(x, 16) for x in serial]
flag = ''
for idx in range(0x1f):
    tp = serial[idx] ^ idx 
    if idx % 7 == 0:
        tp = rotr(tp, idx)
    flag += chr(tp)
print flag

    
    




