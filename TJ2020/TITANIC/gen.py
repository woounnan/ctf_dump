import hashlib

from itertools import product
import tqdm
import string
chars = string.ascii_lowercase
f = open('table_md5','w')
f.write('Create hash table with md5\n')
f.write('======================================\n')
f.close()
for length in tqdm.tqdm(range(1, 10)):
	to_attempt = product(chars, repeat=length)
	for attempt in to_attempt:
		brute = ''.join(attempt)
                enc = hashlib.md5('tjctf{'+brute+'}').hexdigest()
                f = open('table_md5', 'a')
                f.write(enc+'\n')
                f.close()
                if enc == 'e246dbab7ae3a6ed41749e20518fcecd':
                    print 'found : ' + brute
                    f = open('key.txt', 'w')
                    f.write(brute)
                    f.close()





