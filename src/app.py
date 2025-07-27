from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello from DevOps Bootcamp!'

@app.route('/hello')
def hello():
    return 'Hello World from /hello endpoint'

if __name__ == '__main__':
    app.run(debug=True)
