import Blowfish

c = base64.decode(ciphertext)
D2 = Blowfish.decrypt(K2, c)
D1 = Blowfish.decrypt(K1, D2)
plaintext = base64.encode(D1)

