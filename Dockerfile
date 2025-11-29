FROM debian:bookworm-slim

# Install dependencies (curl + apt transport stuff)
RUN apt-get update && apt-get install -y \
    curl gpg \
    && rm -rf /var/lib/apt/lists/*

# Fetch and run the Jamulus repo setup script
RUN curl -fsSL https://raw.githubusercontent.com/jamulussoftware/jamulus/main/linux/setup_repo.sh -o /tmp/setup_repo.sh \
    && chmod +x /tmp/setup_repo.sh \
    && /tmp/setup_repo.sh \
    && rm /tmp/setup_repo.sh

# Install Jamulus headless only
RUN apt-get update \
    && apt-get install -y jamulus-headless \
    && rm -rf /var/lib/apt/lists/*

# Expose Jamulus default server port
EXPOSE 22124/udp

# Run the server
ENTRYPOINT ["jamulus-headless"]