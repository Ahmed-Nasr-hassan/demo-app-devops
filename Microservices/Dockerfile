# Use Python 3.9 as the base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port 5000 
EXPOSE 5000

# Run the application using gunicorn app server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.main:app"]