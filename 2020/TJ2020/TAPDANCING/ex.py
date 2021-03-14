cipher = '1101111102120222020120111110101222022221022202022211'

dec = ''
for x in cipher:
    if x == '1':
        dec += '.'
    elif x == '0':
        dec += '/'
    elif x == '2':
        dec += '_'
print 'decoded : ' + dec
        
