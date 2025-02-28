# Use an official Python runtime as a base image
FROM python:3.10-slim as builder

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt --target=/dependencies

# Use a minimal Python runtime for the final image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /dependencies /usr/local/lib/python3.10/site-packages/

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 8000

# Command to run the application
CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

