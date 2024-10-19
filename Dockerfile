# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port 8000 for Django's development server
EXPOSE 8000

# Define the default command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
