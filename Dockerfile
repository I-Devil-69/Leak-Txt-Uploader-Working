# /app/Dockerfile
FROM python:3.9.2-slim-buster

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port for Render
EXPOSE 8717

# Run the Flask app
CMD ["python3", "app.py"]
