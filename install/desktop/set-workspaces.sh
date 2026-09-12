#!/bin/bash

# Fixed number of workspaces
gsettings set org.gnome.mutter dynamic-workspaces false

# Number of workspaces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Workspace names
gsettings set org.gnome.desktop.wm.preferences workspace-names \
  "[
'Programming',
'Browser',
'Gaming',
'Media',
'Communication',
'Misc'
]"

gsettings set org.gnome.shell.extensions.auto-move-windows application-list \
  "[
'com.mitchellh.ghostty.desktop:1',
'Activity.desktop:1',
'Neovim.desktop:1',
'firefox-esr.desktop:2',
'steam.desktop:3',
'com.stremio.Stremio.desktop:4',
'chrome-music.youtube.com__-Default.desktop:4',
'Signal.desktop:5',
'chrome-web.whatsapp.com__-Default.desktop:5'
]"
