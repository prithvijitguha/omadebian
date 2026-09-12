#!/bin/bash

pipx install gnome-extensions-cli --system-site-packages

# Install a fork of tiling shell
wget -O /tmp/tilingshell.zip 'https://github.com/J4KE-B/tilingshell/releases/download/v17.3-dynamic.1/tilingshell@ferrarodomenico.com.zip'
# Install new extensions
gnome-extensions install --force /tmp/tilingshell.zip
gnome-extensions install tactile@lundal.io
gnome-extensions install just-perfection-desktop@just-perfection
gnome-extensions install blur-my-shell@aunetx
gnome-extensions install space-bar@luchrioh
gnome-extensions install tophat@fflewddur.github.io
gnome-extensions install auto-move-windows@gnome-shell-extensions.gcampax.github.com
gnome-extensions install dash-to-dock@micxgx.gmail.com

# Setup tiling shell
gnome-extensions enable tilingshell@ferrarodomenico.com
# Compile gsettings schemas
sudo cp ~/.local/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/space-bar@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.auto-move-windows.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure tilingshell
gsettings set org.gnome.shell.extensions.tilingshell show-indicator false

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 6
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure Space Bar
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons true
gsettings set org.gnome.shell.extensions.tophat show-cpu true
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem true
gsettings set org.gnome.shell.extensions.tophat show-fs false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bytes

# Configure dash-to-dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
