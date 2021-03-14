import base64
from Crypto.Cipher import AES

BUFF = 256
BLOCK_SIZE = 16


def to_blocks(txt):
    return [txt[i*BLOCK_SIZE:(i+1)*BLOCK_SIZE] for i in range(len(txt)//BLOCK_SIZE)]

def xor(b1, b2=None):
    if isinstance(b1, list) and b2 is None:
        assert len(set([len(b) for b in b1])) == 1, 'xor() - Invalid input size'
        assert all([isinstance(b, bytes) for b in b1]), 'xor() - Invalid input type'
        x = [len(b) for b in b1][0]*b'\x00'
        for b in b1:
            x = xor(x, b)
        return x
    assert isinstance(b1, bytes) and isinstance(b2, bytes), 'xor() - Invalid input type'
    return bytes([a ^ b for a, b in zip(b1, b2)])



def decrypt(enc, key, iv):
    global key2, iv2
    assert len(key) == BLOCK_SIZE, f'Invalid key size'
    assert len(iv) == BLOCK_SIZE, 'Invalid IV size'
    assert len(enc) % BLOCK_SIZE == 0, 'Invalid plaintext size'
    bs = len(key)
    blocks = to_blocks(enc)
    dtxt = b''
    aes = AES.new(key, AES.MODE_ECB)
    curr = iv
    for block in blocks:
        dtxt += xor(aes.decrypt(block), curr)
        curr = xor(block, dtxt[-bs:])
    return str(dtxt, encoding='utf8')


enc_flag = base64.b64decode('Ff9XXv18Ddcl48dMOYkBAlYAtANzxMApPxdagQ9M2Nb22gm1uHP5tyUdkTnz3/FvKxdk6PvKLzF5AHuUcvWb9g==')

iv = enc_flag[:16]
ctxt = enc_flag[16:]
key2 = xor(to_blocks(ctxt))

enc_flag2 = base64.b64decode('qyGvHzTkXK15raxzgXMU/ICNo5Bx8CwqI/ZXWDeaeUyOJ+HGu3kN0O0sJ4Cn7rRhyOLxBg7Au16TvsTEadG9Nw==')

iv2 = enc_flag2[:16]
ctxt2 = enc_flag2[16:]

print(decrypt(ctxt2, key2, iv2))
