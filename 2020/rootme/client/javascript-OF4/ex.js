    var enc = "\x71\x11\x24\x59\x8d\x6d\x71\x11\x35\x16\x8c\x6d\x71\x0d\x39\x47\x1f\x36\xf1\x2f\x39\x36\x8e\x3c\x4b\x39\x35\x12\x87\x7c\xa3\x10\x74\x58\x16\xc7\x71\x56\x68\x51\x2c\x8c\x73\x45\x32\x5b\x8c\x2a\xf1\x2f\x3f\x57\x6e\x04\x3d\x16\x75\x67\x16\x4f\x6d\x1c\x6e\x40\x01\x36\x93\x59\x33\x56\x04\x3e\x7b\x3a\x70\x50\x16\x04\x3d\x18\x73\x37\xac\x24\xe1\x56\x62\x5b\x8c\x2a\xf1\x45\x7f\x86\x07\x3e\x63\x47";

var table_ascii = 'abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ1234567890!@#$%^&*()-=_+[]{};\',./<>?'
var arr_flag = [];
function _(x, y) {
    return x ^ y;
}

function ___(y) {
    var z = 0;
    for (var i = 8 - y; i < 8; i++) {
        z += Math.pow(2, i);
    }
    return z
}
function _____(x, y) {
    y = y % 8;
    Ï = ___(y);
    Ï = (x & Ï) >> (8 - y);
    return ((Ï) + (x << y)) & 0x00ff;
}

function ______(x, y) {
    return _____(x, y)
}

function encrypt(_________, key) {
    ________ = "";
    ________2 = "";
    for (var i = 0; i < _________.length; i++) {
        c = _________.charCodeAt(i);
	    console.log('c:' + c);
        if (i != 0) {
            t = ________.charCodeAt(i - 1) % 2;
            switch (t) {
                case 0:
                    cr = _(c, key.charCodeAt(i % key.length));
                    break;
                case 1:
                    cr = ______(c, key.charCodeAt(i % key.length));
                    break;
            }
        } else {
            cr = _(c, key.charCodeAt(i % key.length));
        }
        ________ += String.fromCharCode(cr);
    }
    return ________;
}

function getFlag(key) {
    var ŋ = 0;
    for (var i = 0; i < key.length; i++) {
        ŋ += key["charCodeAt"](i)
    }
    console.log('result: ' + ŋ)
    if (ŋ == 8932) {
        for(x in key){
                if(!(key[x] in table_ascii.split(''))){
                            return
		}
        }
        console.log('flags: ' +key);
        arr_flag.push(key);
    }
}
value = '1234567890'
getFlag(encrypt(enc, value)); 


