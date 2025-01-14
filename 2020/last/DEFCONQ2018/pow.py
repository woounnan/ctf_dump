#!/usr/bin/env python2
from __future__ import print_function
import sys
import struct
import hashlib

from pwn import *

# inspired by C3CTF's POW

def pow_hash(challenge, solution):
    return hashlib.sha256(challenge.encode('ascii') + struct.pack('<Q', solution)).hexdigest()

def check_pow(challenge, n, solution):
    h = pow_hash(challenge, solution)
    return (int(h, 16) % (2**n)) == 0

def solve_pow(challenge, n):
    candidate = 0
    while True:
        if check_pow(challenge, n, candidate):
            return candidate
        candidate += 1

def proof_of_work(p):
    messages = p.recvuntil("Solution:")
    messages = messages.split("\n")
    challenge = messages[1].split(": ")[1]
    n = int(messages[2].split(": ")[1])
    log.info("POW Challenge: {} {}".format(challenge, n))

    payload = solve_pow(challenge, n)
    log.info("POW Solution: {}".format(payload))

    p.sendline(str(payload))

if __name__ == '__main__':
    p = remote(sys.argv[1], sys.argv[2])
    proof_of_work(p)
    p.interactive()
