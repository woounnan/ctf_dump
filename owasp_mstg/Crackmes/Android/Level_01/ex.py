import frida, sys
 
def on_message(message, data):
    if message['type'] == 'send':
        print("[*] {0}".format(message['payload']))
    else:
        print(message)
 
 
PROCESS_NAME = "owasp.mstg.uncrackable1"
 
 
jscode= """
console.log("[*] Starting script");
Java.perform(function() {
    /*
        var class_exit = null;
        class_exit = Java.use("java.lang.System");
        class_exit.exit.implementation = function() {
            console.log("[*] System.exit called");
        }
        var class_a = null;
        class_a = Java.use('sg.vantagepoint.a.a');
        class_a.a.implementation = function(str, str2){
            var res = this.a(str, str2);
            console.log("[*] a::a.a called");
            var serial = '';
            for(var x in res){
                serial += String.fromCharCode(res[x]);
            }
            console.log('serial: ', serial);
            return res;
        }
        */
    });
"""

process = frida.get_usb_device().attach(PROCESS_NAME)
script = process.create_script(jscode)
script.on('message', on_message)
print('[*] Running Hook')
script.load()
sys.stdin.read()
 
