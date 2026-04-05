#!/bin/bash
# GNOME Files (Nautilus) and file management

set -e

paru -S --needed --noconfirm \
    nautilus \
    gvfs \
    gvfs-mtp \
    gvfs-smb \
    gvfs-gphoto2 \
    ffmpegthumbnailer \
    sushi \
    file-roller \
    gnome-keyring \
    nautilus-open-any-terminal
