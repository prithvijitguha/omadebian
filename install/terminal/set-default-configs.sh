#!/bin/bash

# Setup default configs
cp ~/.local/share/meradeb/configs/.p10.zsh ~/.p10.zsh
cp ~/.local/share/meradeb/configs/.profile ~/.profile
cp ~/.local/share/meradeb/configs/.zshrc ~/.zshrc
cp ~/.local/share/meradeb/configs/.tmux.conf ~/.tmux.conf

# Use meradeb btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/meradeb/configs/btop.conf ~/.config/btop/btop.conf

# Meradeb integration
export MERADEB_PATH="$HOME/.local/share/meradeb"
export PATH="$HOME/.local/share/meradeb/bin:$HOME/.local/bin:$PATH"
