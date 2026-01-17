#!/bin/bash
# tmux mouse mode
echo "set -g mouse on" >> ~/.tmux.conf

# atuin
curl -sS https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | bash
echo 'eval "$(atuin init bash)"' >> ~/.bashrc

echo "Done! Restart shell or run: source ~/.bashrc"
