#!/bin/bash

MERADEB_THEME_COLOR="red"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#e92020"
