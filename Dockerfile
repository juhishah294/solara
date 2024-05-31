# Use the python base image
FROM python:3.11-slim-bookworm

# Install necessary build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install solara and its dependencies
RUN pip install solara

# Set the working directory
WORKDIR /srv

# Copy and install Python dependencies
COPY requirements.txt /srv/
RUN pip install -r requirements.txt --no-cache-dir

# Copy the rest of the application code
COPY . /srv

# Set the command to run the application
CMD ["python", "app.py"]
