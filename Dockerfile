# Use the official Python image as the base image
FROM python:3.10-alpine
RUN apk add --no-cache bash
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
