FROM ubuntu:latest

# Install Dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git && \
  rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install pyyaml

# Copy Python script and shell script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
