serial = """52 DF B3 60 F1 8B 1C B5 57 D1 9F 38 4B 29 D9 26 7F C9 A3 E9 53 18 4F B8 6A CB 87 58 5B 39 1E""".split(' ')

serial = [ int(x) for x in serial]

for idx in range(0x1f):
    tp = serial[idx] ^ idx 
    if idx % 7 == 0:
        tp ^ 



