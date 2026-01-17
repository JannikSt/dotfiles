#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up dotfiles..."

# tmux
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
echo "✓ tmux.conf"

# Reload tmux if running
if command -v tmux &>/dev/null && tmux list-sessions &>/dev/null; then
    tmux source-file ~/.tmux.conf
    echo "✓ tmux reloaded"
fi

echo "Done!"
