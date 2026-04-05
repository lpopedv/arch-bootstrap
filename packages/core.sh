#!/bin/bash
# Core system utilities

set -e

paru -S --needed --noconfirm \
    stow \
    zsh \
    fzf \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    direnv \
    eza \
    starship \
    mise \
    ttf-jetbrains-mono-nerd \
    ghostty \
    inotify-tools \
    unzip
