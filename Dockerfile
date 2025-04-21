# Use debian as the base image
FROM debian:latest

# Install necessary packages and download VS Code CLI
RUN apt-get update && \
    apt-get install -y git curl sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
        --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz

# Create a non-root user
RUN useradd -m codeuser && \
    echo 'codeuser ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/codeuser && \
    chmod 0444 /etc/sudoers.d/codeuser && \
    usermod -aG sudo codeuser

# Switch to the non-root user
USER codeuser

# Set the home directory for the non-root user
ENV HOME=/home/codeuser

# Set the working directory
WORKDIR $HOME

# Start the VS Code server tunnel
CMD [ "code", "tunnel", "--accept-server-license-terms" ]