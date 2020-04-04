data = []
with open('secret.img', 'rb') as f:
    bts = f.read()
    #for idx in range(0,bts,2):
    for b in bts:
        #data.append(0xff ^ int(b.encode('hex'),16))
        data.append(0xff ^ b)
        #data.append(0xff ^ int(b.encode('hex'),16))

    with open('key', 'wb') as fw:
        fw.write(bytearray(data))
