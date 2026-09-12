#!/bin/bash

gum log --structured --level info "Installing gnome related extensions and settings"
source ~/.local/share/meradeb/install/desktop/set-gnome-extensions.sh
source ~/.local/share/meradeb/install/desktop/fonts.sh
# Set the everforest theme as default
export THEME='everforest'
source ~/.local/share/meradeb/themes/everforest/gnome.sh
source ~/.local/share/meradeb/install/desktop/set-gnome-theme.sh
source ~/.local/share/meradeb/install/desktop/set-gnome-hotkeys.sh
source ~/.local/share/meradeb/install/desktop/set-dock.sh
source ~/.local/share/meradeb/install/desktop/set-workspaces.sh
