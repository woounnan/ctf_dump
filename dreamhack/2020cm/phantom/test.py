import blowfish
import base64






enc = None
with open('password.txt') as f:
	enc = base64.b64decode(f.read())

key = None
with open('keys.txt') as f:
	key = f.read().split('K2 = * * ')[1].replace(' ', '')
for x in range(0xffff):
	try:
		x = bytes.fromhex(str(x).rjust(4, '0')).decode()
	except UnicodeDecodeError:
		continue
	cipher = blowfish.Cipher((x+key).encode())
	data_decrypted = b"".join(cipher.decrypt_ecb(enc))
	try:
		print (base64.b64decode(data_decrypted).decode())
	except:
		continue

#data = b'a'*(10 * 8) # data to encrypt
#data_encrypted = b"".join(cipher.encrypt_ecb(data))


