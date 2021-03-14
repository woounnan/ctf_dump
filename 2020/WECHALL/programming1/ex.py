import requests
cookie = {'WC' : '12660293-54119-cdQWfhBGF6nfbAd1'}

res = requests.get('https://www.wechall.net/challenge/training/programming1/index.php?action=request', cookies = cookie)

print 'key: ' + res.text


#res = requests.get('https://www.wechall.net/challenge/training/programming1/index.php?answer='+res.text, cookies = cookie)
print 'https://www.wechall.net/challenge/training/programming1/index.php?answer='+res.text

