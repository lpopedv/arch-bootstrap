#!/bin/bash
# Dotfiles installer — run this to set up the full environment

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Guards ────────────────────────────────────────────────────────────────────

if [[ "$EUID" -eq 0 ]]; then
    echo "Error: do not run this script as root." >&2
    exit 1
fi

if ! command -v pacman &>/dev/null; then
    echo "Error: this script is intended for Arch Linux only." >&2
    exit 1
fi

# ── Install steps ─────────────────────────────────────────────────────────────

echo "==> Installing paru (AUR helper)..."
bash "$DOTFILES/packages/paru.sh"

echo "==> Installing core packages..."
bash "$DOTFILES/packages/core.sh"

echo "==> Installing desktop environment..."
bash "$DOTFILES/packages/desktop.sh"

echo "==> Installing browser..."
bash "$DOTFILES/packages/browser.sh"

echo "==> Installing dev tools..."
bash "$DOTFILES/packages/dev.sh"

echo "==> Installing Docker..."
bash "$DOTFILES/packages/docker.sh"

echo "==> Linking dotfiles via stow..."
cd "$DOTFILES" && stow doom zsh ghostty hypr waybar fuzzel

# ── Shell ─────────────────────────────────────────────────────────────────────

ZSH_PATH="$(command -v zsh)"

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
    echo "==> Setting zsh as default shell..."
    if ! grep -qxF "$ZSH_PATH" /etc/shells; then
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH_PATH"
    echo "    Shell changed. Re-login to apply."
else
    echo "==> zsh is already the default shell."
fi

echo ""
echo "Done! Re-login or open a new terminal to apply all changes."
