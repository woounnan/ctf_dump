from ctypes import *
libc = '/lib/x86_64-linux-gnu/libc-2.19.so'
funcs = CDLL(libc)
print type(funcs)
funcs.printf('test')
