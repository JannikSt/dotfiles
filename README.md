# Dotfiles

Personal dotfiles for quick machine setup.

## Quick Start

Clone and install on any new machine:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

### Tmux Configuration (`.tmux.conf`)
- Mouse support enabled
- Prefix key: `Ctrl+Space` (instead of default `Ctrl+b`)
- Better split pane bindings: `|` for vertical, `-` for horizontal
- Config reload: `Ctrl+Space` + `r`
- Increased scrollback buffer (10,000 lines)
- Better colors and numbering

## Manual Commands

If you need to configure tmux manually on a machine:

```bash
# Enable/disable mouse
tmux set -g mouse on
tmux set -g mouse off

# Change leader to Ctrl+Space
tmux unbind C-b && tmux set -g prefix C-Space && tmux bind C-Space send-prefix

# Revert leader to Ctrl+b
tmux unbind C-Space && tmux set -g prefix C-b && tmux bind C-b send-prefix
```

## Adding More Dotfiles

1. Add the config file to this repo (e.g., `.vimrc`, `.bashrc`, `.zshrc`)
2. Update `install.sh` to symlink it
3. Commit and push

## Structure

```
dotfiles/
├── .tmux.conf       # Tmux configuration
├── install.sh       # Setup script
└── README.md        # This file
```
