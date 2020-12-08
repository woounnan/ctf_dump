from pwn import *
context.arch= 'amd64'
run_assembly(shellcraft.sh())
