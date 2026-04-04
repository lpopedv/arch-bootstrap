#!/bin/bash
# Audio (PipeWire stack)

set -e

paru -S --needed --noconfirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber

# Enable as user services
systemctl --user enable --now pipewire pipewire-pulse wireplumber
