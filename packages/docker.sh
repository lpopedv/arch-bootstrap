#!/bin/bash
# Docker

set -e

paru -S --needed --noconfirm \
    docker \
    docker-compose \
    docker-buildx

# Enable and start Docker daemon
sudo systemctl enable --now docker

# Add current user to docker group (avoids needing sudo for docker commands)
if ! groups "$USER" | grep -q '\bdocker\b'; then
    sudo usermod -aG docker "$USER"
    echo "    Added $USER to docker group. Re-login to apply."
fi
