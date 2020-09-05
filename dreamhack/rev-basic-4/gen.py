serial = """24 27 13 C6 C6 13 16 E6 47 F5 26 96 47 F5 46 27 13 26 26 C6 56 F5 C3 C3 F5 E3 E3""".split(' ')
serial = [ int(x, 16) for x in serial ] 

flags = ''
for x in serial:
    flags += chr(((x << 4) & 0xf0) | x >> 4)

print flags
