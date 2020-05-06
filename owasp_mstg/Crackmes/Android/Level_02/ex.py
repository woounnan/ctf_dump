import frida,sys

def dispatchMsg(msg, data):
    for k, v in msg.items():
        print 'key: ' + (k)
        print 'value: ' + str(v)


jscode="""
console.log("[*] Starting script");
Java.perform(function(){
    console.log("[*] in perform");
    var class_System = null;
    class_System = Java.use("java.lang.System");
    class_System.exit.implementation = function(){
        console.log("[*] System.exit called!!");
    }
    /*
    var addr_strncmp = null;
    var list_func = Module.enumerateImportsSync('libfoo.so');
    for(var idx in list_func){
        if(list_func[idx].name == 'strncmp'){
            addr_strncmp = list_func[idx].address;
            break;
        }
    }
    */
    Interceptor.attach(Module.findExportByName('libfoo.so', 'strncmp'), {'onEnter': function(args){
if(args[2].toInt32() == 23){
    console.log("serial: ", Memory.readUtf8String(args[1], 23));
    }
    }});

    

});
"""


p = frida.get_usb_device().attach('owasp.mstg.uncrackable2')
script = p.create_script(jscode)
script.on('message', dispatchMsg)
print('[*] Running Frida')
script.load()
sys.stdin.read()
