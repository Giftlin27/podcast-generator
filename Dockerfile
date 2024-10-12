FROM ubuntu:latest

# Install Dependencies and Python Dev Tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libpython3.10-dev && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install pyyaml with verbose logging
RUN python3 -m pip install --upgrade pip && \
    pip3 install --verbose pyyaml

# Copy Python script and shell script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

