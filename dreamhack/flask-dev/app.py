#!/usr/bin/python3
from flask import Flask
import os

app = Flask(__name__)
app.secret_key = os.urandom(32)

@app.route('/')
def index():
	return 'Hello !'

@app.route('/<path:file>')
def file(file):
        print('###################')
        print(file)
        print('###################')
        ret = open(file).read()
        return ret

app.run(host='0.0.0.0', port=8888, threaded=True)
