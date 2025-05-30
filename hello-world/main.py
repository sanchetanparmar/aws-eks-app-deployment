from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World! commit 1"

@app.route('/healthz')
def health():
    return "OK", 200
