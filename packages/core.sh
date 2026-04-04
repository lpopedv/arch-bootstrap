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
    asdf-vm \
    ttf-jetbrains-mono-nerd \
    ghostty
