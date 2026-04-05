# arch-bootstrap

Personal Arch Linux setup — packages, desktop environment, and dotfiles via [GNU Stow](https://www.gnu.org/software/stow/).

## Requirements

- Arch Linux
- Non-root user with `sudo` access

## Install

```bash
git clone https://github.com/<your-username>/arch-bootstrap.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Structure

```
.dotfiles/
├── install.sh
├── packages/
│   ├── paru.sh       # AUR helper bootstrap
│   ├── core.sh       # Shell and terminal utilities
│   ├── desktop.sh    # Hyprland ecosystem
│   ├── browser.sh    # Browser
│   └── dev.sh        # Editor and dev tools
└── config/           # Stow-managed dotfiles
```
