# Dotfiles

Personal dotfiles for quick machine setup.

## Quick Start

**On a new remote machine** (with SSH agent forwarding):

```bash
# Connect with agent forwarding to use your local SSH keys
ssh -A user@remote-host

# Clone and install
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh

# Update your email in .gitconfig
vim ~/.gitconfig  # Change the email field
```

The install script will:
- Symlink all dotfiles to your home directory
- Install git and tmux if missing
- Test GitHub SSH connectivity
- Back up any existing configs

## What's Included

### Git Configuration (`.gitconfig`)
- Sensible defaults for user, editor, and pull behavior
- Default branch: `main`
- Auto-setup remote on push
- Useful aliases: `st`, `co`, `br`, `ci`, `lg` (pretty log)
- Color output enabled
- Fetch pruning enabled

**Note:** Update your email address in `.gitconfig` after installation!

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

## SSH Agent Forwarding

To use your local SSH keys on remote machines:

```bash
# Connect with agent forwarding
ssh -A user@remote-host

# Verify it's working
ssh -T git@github.com
```

To make agent forwarding default for specific hosts, add to `~/.ssh/config`:

```
Host your-remote-server
    ForwardAgent yes
```

## Structure

```
dotfiles/
├── .gitconfig       # Git configuration
├── .gitignore       # Ignore backup files
├── .tmux.conf       # Tmux configuration
├── install.sh       # Setup script
└── README.md        # This file
```
