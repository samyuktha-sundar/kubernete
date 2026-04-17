from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def home():
    return "Factorial API Running"

@app.route('/factorial')
def factorial():
    n = int(request.args.get('n'))
    fact = 1
    for i in range(1, n+1):
        fact *= i
    return str(fact)

app.run(host='0.0.0.0', port=3000)
