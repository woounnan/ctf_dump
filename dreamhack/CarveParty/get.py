
pumpkin = [ 124, 112, 59, 73, 167, 100, 105, 75, 59, 23, 16, 181, 165, 104, 43, 49, 118, 71, 112, 169, 43, 53 ];
counter = 0;
pie = 1;
for x in range(10000):
    for i in range(len(pumpkin)):
        if x%100 == 0:
            pumpkin[i] ^= pie
            pie = ((pie ^ 0xff) + (i * 10)) & 0xff
print(bytearray(map(lambda x: x, pumpkin)))
