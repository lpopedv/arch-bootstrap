#!/bin/bash
# Install paru (AUR helper)

set -e

if command -v paru &>/dev/null; then
    echo "    paru already installed, skipping."
    exit 0
fi

sudo pacman -S --needed --noconfirm base-devel git

cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd /tmp && rm -rf paru
