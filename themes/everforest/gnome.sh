#!/bin/bash

MERADEB_THEME_COLOR="bark"
source $MERADEB_PATH/themes/set-gnome-theme.sh
# Set the gnome shell setting color
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#78ab50"
