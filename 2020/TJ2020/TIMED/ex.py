from pwn import *

context.update(log_level='debug')
p = None
flag_con = 0

while True:
    if flag_con == 0:
        p = remote('p1.tjctf.org', 8005)
        flag_con = 1
    _recv = p.recvrepeat(1)
    if _recv.find('Error') != -1:
        flag_con = 0
        continue
    p.send(raw_input())


    

