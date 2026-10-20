# Use an official Python image as the base
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /code

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY main.py .

# Expose the port your app will run on
EXPOSE 8000

# Start the FastAPI app using uvicorn
# 0.0.0.0 is important so it's accessible from outside the container
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]