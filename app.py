# /app/app.py
from flask import Flask
import os
import subprocess

app = Flask(__name__)

# Health check endpoint for Render
@app.route('/')
def health():
    return 'Bot is running!', 200

# Start the bot's main script
def start_bot():
    subprocess.Popen(["python3", "/app/modules/main.py"])  # Path confirmed from Dockerfile

if __name__ == '__main__':
    start_bot()  # Start the bot when the Flask app starts
    port = int(os.getenv('PORT', 8717))  # Use Render’s PORT or default to 8000
    app.run(host='0.0.0.0', port=port)
