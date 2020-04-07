rax = 0
rdx = 0

high = 0xffffffff00000000
low = 0xffffffff
def b_plus(val, add):
    return (val & 0xffffffffffffff00) + ((val + add) & 0xff)

def dw_and(val, add):
    return (val & high) | ((val & add) & low)

def dw_xor(val, add):
    return (val & high) | ((val ^ add) & low)

def dw_or(val, add):
    return (val & high) | ((val | add) & low)

def dw_plus(val, add):
    return (val & high) | ((val + add) & low)
    
def dw_minus(val, add):
    return (val & high) | ((val - add) & low)

def dw_mul(val, add):
    return (val & high) | ((val * add) & low)

def dw_sal(val, count):
    sign = 1 << (32 - 1)
    if val | sign == val:
        val = val << count
        val = val | (1 << (32 - 1))
    else:
        val = val << count
    return val

def func1():
    rbp_1 = 25
    rbp_8 = 0
    while rbp_8 <= 9:
        rax = rbp_8
        rax = dw_plus(rax, 10)
        rdx = rax 
        rax = rdx
        rax = dw_sal(rax, 2)
        rax = dw_plus(rax, rdx)
        rdx = dw_mul(rax, 4) 
        rax = dw_plus(rax, rdx)
        rbp_1 = b_plus(rbp_1, rax)
        rbp_8 += 1
    rax = rbp_1
    rbp_12 = rax
    rax = rbp_12
    return rax

def func2():
    rbp_4 = 207
    rax = rbp_4
    return rax

def func3(rdi, rsi):
    rbp_36 = rdi
    rbp_40 = rsi
    if rbp_36 > 64:
        if rbp_40 <= 211:
            #L12
            if rbp_36 == 0 or rbp_40 != 0:
                #L13
                if rbp_36 != 0 or rbp_40 == 0:
                    #L14
                    rax = rbp_36
                    rax = dw_or(rax, rbp_40)
                    rbp_12 = rax
                    rax = rbp_36
                    rax = dw_and(rax, rbp_40)
                    rbp_16 = rax
                    rax = rbp_36
                    rax = dw_xor(rax, rbp_40)
                    rbp_20 = rax
                    rbp_4 = 0
                    rbp_8 = 0
                    #L15
                    while rbp_8 < rbp_20:
                        #L16
                        rax = rbp_16
                        rax = dw_minus(rax, rbp_8)
                        rdx = rax
                        rax = rbp_12
                        rax = dw_plus(rax, rdx)
                        rbp_4 = dw_plus(rbp_4, rax)
                        rbp_8 += 1
                    rax = rbp_4
                    return rax
                else:
                    rax = 220
                    return rax
            else:
                rax = 120
                return rax
        else:
            rax = 20
            return rax
    else:
        rax = 24
        return rax


    





rbp_4 = func1()
print hex(rbp_4)
rax = 0
rbp_8 = func2()

ret = func3(rbp_4, rbp_8)

print 'result: ' + str(ret)


