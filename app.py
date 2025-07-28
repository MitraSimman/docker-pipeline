from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({
        "message": "Hello from Python Flask!",
        "environment": os.getenv('NODE_ENV', 'development')
    })

@app.route('/health')
def health_check():
    return jsonify({
        "status": "healthy",
        "service": "python-app"
    }), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 80))
    app.run(host='0.0.0.0', port=port, debug=False)
