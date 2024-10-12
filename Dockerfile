# Use the official Python 3.10 slim image as the base
FROM python:3.10-slim

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install PyYAML
RUN pip install --upgrade pip && \
    pip install pyyaml

# Copy the feed.py and entrypoint.sh scripts into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the shell script
ENTRYPOINT ["/entrypoint.sh"]




