with open('secret.img', 'rb') as f:
    bts = f.read()
    res = bytes(map(lambda x : 0xff ^ x, list(bts)))
    with open('key', 'wb') as fw:
        fw.write(res)

