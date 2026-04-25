#!/bin/bash
set -euo pipefail

# Get the absolute path to this script's directory
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure config dir exists
mkdir -p "$HOME/.config"

# Install nvim (using -n for directory safety)
echo "Linking nvim -> ~/.config/nvim"
ln -snf "$BASEDIR/nvim" "$HOME/.config/nvim"

# Install tmux.conf
echo "Linking tmux.conf -> ~/.tmux.conf"
ln -snf "$BASEDIR/tmux.conf" "$HOME/.tmux.conf"

echo "Done!"
