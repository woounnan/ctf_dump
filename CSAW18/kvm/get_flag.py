bitarray = [0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1]

char_map = {'\n': [0, 0, 1, 1, 1, 0, 1, 0], ' ': [1, 1, 1, 1, 0], '.': [1, 0, 1, 1, 1, 0, 1, 0], '1': [0, 1, 1, 0, 0], '0': [0, 0, 0], '3': [0, 0, 0, 0, 1, 0], '2': [0, 1, 1, 1, 1, 0, 1, 0], '5': [1, 1, 0, 0, 1, 0, 0], '4': [0, 0, 0, 1, 1, 1, 0], '7': [1, 0, 0, 0, 1, 0], '6': [1, 1, 0, 1, 1, 0], '?': [0, 0, 0, 1, 0, 1, 0], 'a': [1, 0, 0, 1, 1, 0], 'c': [1, 0, 0, 1, 0, 1, 0], 'b': [0, 1, 0, 1, 0, 1, 0], 'e': [1, 1, 1, 1, 1, 0, 1, 0], 'd': [1, 1, 0, 1, 0, 1, 0], 'g': [0, 0, 1, 1, 0, 1, 0], 'f': [0, 1, 0, 0, 1, 0], 'i': [1, 1, 0, 0, 1, 0], 'h': [1, 0, 0, 1, 1, 1, 0], 'm': [0, 0, 0, 0, 0, 1, 1, 0], 'l': [0, 1, 0, 1, 1, 1, 0], 'o': [1, 0, 1, 0, 0], 'n': [1, 0, 0, 0, 0, 1, 1, 0], 's': [0, 1, 0, 1, 1, 0], 'r': [1, 0, 1, 1, 0, 1, 0], 'u': [1, 1, 0, 1, 1, 1, 0], 't': [1, 1, 1, 0, 0], 'w': [0, 0, 0, 1, 0, 0], 'x': [0, 1, 0, 0, 0, 1, 1, 0], '{': [1, 1, 0, 0, 0, 1, 1, 0], '\x00':[1], '}': [0, 1, 0, 0, 1, 0, 0]}

# '}': [0, 1, 0, 0, 1, 0, 0]
def eqs(a,b):
  if len(a) == len(b) and len(b) == 0:
    return True
  return a[0] == b[0] and eqs(a[1:], b[1:])

offset = 0
flag = ''
i = 0
while True:
  max_length = 0
  character = ''
  for c, d in char_map.iteritems():
    if i == 0 and c == '}':
      continue
    if c == '5':
      continue
    l = len(d)
    if eqs(bitarray[offset:offset+l], d):
      if l > max_length:
        max_length = l
        character = c
  flag += character
  print(flag)
  offset += max_length
  i += 1
  if offset == len(bitarray):
    break
