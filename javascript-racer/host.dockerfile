# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages: git and Python
RUN apt-get update && \
    apt-get install -y git python3 && \
    apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/jakesgordon/javascript-racer.git

# Change the working directory to the cloned repository
WORKDIR /app/javascript-racer

# Expose port 8080 for the HTTP server
EXPOSE 8080

# Command to run the Python embedded HTTP server
CMD ["python3", "-m", "http.server", "8080"]