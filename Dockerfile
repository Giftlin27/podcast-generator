FROM ubuntu:latest

# Install Dependencies and Python Dev Tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    python3-dev \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install PyYAML with break-system-packages option
RUN python3 -m pip install --upgrade pip --break-system-packages && \
    pip3 install pyyaml --break-system-packages

# Copy Python script and shell script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]



