#!/bin/bash

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$MERADEB_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$MERADEB_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$MERADEB_THEME_COLOR" 2>/dev/null || true

BACKGROUND_DIR="$MERADEB_PATH/themes/$THEME/backgrounds"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"

set_background() {
  local background="$1"
  local name
  local dest

  name=$(basename "$background")
  dest="$BACKGROUND_DEST_DIR/$name"

  [ -f "$dest" ] || cp "$background" "$dest"

  gsettings set org.gnome.desktop.background picture-uri "$dest"
  gsettings set org.gnome.desktop.background picture-uri-dark "$dest"
  gsettings set org.gnome.desktop.background picture-options 'zoom'
}

BACKGROUNDS=()

for background in "$BACKGROUND_DIR"/*; do
  [ -f "$background" ] || continue
  BACKGROUNDS+=("$(basename "$background")")
done

while true; do
  BACKGROUND=$(gum choose "${BACKGROUNDS[@]}" "<< Back" --header "Choose your background" --height 12)
  if [ -n "$BACKGROUND" ] && [ "$BACKGROUND" != "<<-back" ]; then
    set_background "$BACKGROUND_DIR/$BACKGROUND"
  fi
done

source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
