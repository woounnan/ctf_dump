sc = ''
with open('sc.txt', 'r') as f:
    sc = f.read()

import re
pt = re.compile('[a-z,A-Z,+,0-9,/]{30,}=*')
m = pt.search(sc)
print m.group()

