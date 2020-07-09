import requests
import struct
import zlib

url = 'https://snappaste.ctf.bsidestlv.com/'
paste_url = url + 'paste'
view_url = url + 'view/'
backdoor_url = url + 'backdoor/'

metadata = b'{"name": "alex","date":"2020-06-28T15:52:21.519Z"}'
data_decompressed = 'this is my data'
data_compressed = zlib.compress(data_decompressed)
metadata_size = len(metadata)
data_compressed_size = len(data_compressed)
data_decompressed_size = len(data_decompressed)

paste_data = b''
paste_data += struct.pack('<I', metadata_size)
paste_data += struct.pack('<I', data_compressed_size)
paste_data += struct.pack('<I', data_decompressed_size)
paste_data += metadata
paste_data += data_compressed

r = requests.post(paste_url, data = paste_data, verify = False, headers = { 'Cookie': 'BSidesTLV=af6e736a35c13bfbe3f81d76e271a1aa52c3e937'})
print(r.content)
