#!/bin/bash

set -e

gum log --structured --level info "Installing fonts"

FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"

cd /tmp

# CASCADIA MONO
if ! find "$FONT_DIR" -iname "CaskaydiaMono*.ttf" -o -iname "CascadiaMono*.ttf" | grep -q .; then
  wget -q -O CascadiaMono.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip -q -o CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf "$FONT_DIR"/
  rm -rf CascadiaMono.zip CascadiaFont
fi

# IA WRITER MONO
if ! find "$FONT_DIR" -iname "iAWriterMonoS-*.ttf" | grep -q .; then
  wget -q -O iafonts.zip \
    https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
  unzip -q -o iafonts.zip -d iaFonts
  cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf \
    "$FONT_DIR"/
  rm -rf iafonts.zip iaFonts
fi

# JETBRAINS MONO
if ! find "$FONT_DIR" -iname "JetBrainsMono*.ttf" | grep -q .; then
  echo "Installing JetBrains Mono Nerd Font..."
  wget -q -O JetBrainsMono.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -q -o JetBrainsMono.zip -d JetBrainsMono
  cp JetBrainsMono/*.ttf "$FONT_DIR"/
  rm -rf JetBrainsMono.zip JetBrainsMono
fi

# REFRESH FONT CACHE
fc-cache -f

cd -
