#!/bin/bash
# Development tools

set -e

# Emacs + mandatory Doom dependencies
paru -S --needed --noconfirm \
    emacs \
    ripgrep \
    fd \
    git \
    lazygit \
    cmake \
    libtool

# Install Doom Emacs (stow doom config must run before this script)
if [[ ! -d "$HOME/.config/emacs" ]]; then
    echo "==> Cloning Doom Emacs..."
    git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.config/emacs"
    echo "==> Running doom install..."
    "$HOME/.config/emacs/bin/doom" install
else
    echo "    Doom Emacs already installed, skipping."
fi

# Add doom bin to PATH in zshrc if not already there
ZSHRC="$HOME/.zshrc"
if [[ -f "$ZSHRC" ]] && ! grep -q 'doomemacs\|\.config/emacs/bin' "$ZSHRC"; then
    echo 'export PATH="$HOME/.config/emacs/bin:$PATH"' >> "$ZSHRC"
fi
