#!/usr/bin/env python3
from flask import Flask, request
import os
import base64

app = Flask(__name__)

@app.route('/' , methods=['GET'])
def index():
    result = request.args.get('t', '')
    print(base64.b64decode(result))
    return result

app.run(host='0.0.0.0', port=8989)
