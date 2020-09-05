serial = """AD D8 CB CB 9D 97 CB C4 92 A1 D2 D7 D2 D6 A8 A5 DC C7 AD A3 A1 98""".split(' ')
end = int('4C', 16)

flags = 'L'
for idx in range(len(serial)-1, -1, -1):
    tp = int(serial[idx], 16)
    flags += chr(tp-end)
    end = tp - end
print flags[::-1]


