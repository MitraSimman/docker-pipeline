# Use AWS ECR Public Gallery Python image (avoids Docker Hub rate limits)
FROM public.ecr.aws/docker/library/python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy your Flask application
COPY app.py .

# Expose port 8080 (non-privileged port)
EXPOSE 8080

# Run the Flask application
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=8080"]
