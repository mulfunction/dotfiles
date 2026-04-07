#!/bin/bash
set -e

echo "==> Installing pacman packages..."
sudo pacman -S --needed - < "$(dirname "$0")/pkglist.txt"

echo "==> Installing AUR packages..."
paru -S --needed - < "$(dirname "$0")/aurlist.txt"

echo "==> Applying dotfiles..."
chezmoi apply

echo "==> Done!"
