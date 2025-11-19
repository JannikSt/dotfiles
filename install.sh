#!/bin/bash

set -e

echo "🚀 Setting up dotfiles..."

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Backup existing dotfiles
backup_if_exists() {
    if [ -f "$1" ] || [ -L "$1" ]; then
        echo "📦 Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Symlink dotfiles
link_dotfile() {
    local source="$DOTFILES_DIR/$1"
    local target="$HOME/$1"

    backup_if_exists "$target"
    ln -sf "$source" "$target"
    echo "✓ Linked $1"
}

# Link tmux config
link_dotfile ".tmux.conf"

# Install tmux if not present
if ! command -v tmux &> /dev/null; then
    echo "📥 Installing tmux..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew &> /dev/null; then
            brew install tmux
        else
            echo "⚠️  Homebrew not found. Please install tmux manually."
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v apt-get &> /dev/null; then
            sudo apt-get update && sudo apt-get install -y tmux
        elif command -v yum &> /dev/null; then
            sudo yum install -y tmux
        else
            echo "⚠️  Package manager not found. Please install tmux manually."
        fi
    fi
else
    echo "✓ tmux already installed"
fi

echo ""
echo "✨ Dotfiles setup complete!"
echo "📝 Your old dotfiles have been backed up with .backup extension"
echo ""
echo "To apply tmux config, either:"
echo "  • Start a new tmux session: tmux"
echo "  • Or reload in existing session: tmux source ~/.tmux.conf"
