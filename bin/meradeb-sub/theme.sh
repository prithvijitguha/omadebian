#!/bin/bash

THEMES=()

for theme in "$MERADEB_PATH"/themes/*/colors.toml; do
  [ -f "$theme" ] || continue
  THEMES+=("$(basename "$(dirname "$theme")")")
done

THEME=$(gum choose "${THEMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then

  # Each directory in themes contains a colors.toml
  # We use that colors.toml to generate the tophat and btop files
  THEME_DIR="$MERADEB_PATH/themes/$THEME"
  COLORS="$THEME_DIR/colors.toml"

  # I don't know regex, its the one use of AI that seems to be very helpful
  get_color() {
    sed -n "s/^$1 = \"\\(#[0-9a-fA-F]*\\)\"$/\1/p" "$COLORS"
  }

  # Neovim setup
  if [ -d "$HOME/.config/nvim" ] && [ -f "$THEME_DIR/neovim.lua" ]; then
    cp "$THEME_DIR/neovim.lua" \
      "$HOME/.config/nvim/lua/plugins/theme.lua"
  fi

  # Generate the btop confg dynamically
  cat >"$HOME/.config/btop/themes/$THEME.theme" <<EOF
  theme[main_bg]="$(get_color background)"
  theme[main_fg]="$(get_color foreground)"
  theme[title]="$(get_color foreground)"
  theme[hi_fg]="$(get_color accent)"
  theme[selected_bg]="$(get_color selection)"
  theme[selected_fg]="$(get_color accent)"
  theme[inactive_fg]="$(get_color dark_foreground)"
  theme[graph_text]="$(get_color light_foreground)"
  theme[meter_bg]="$(get_color selection)"
  theme[proc_misc]="$(get_color light_foreground)"
  
  theme[cpu_box]="$(get_color magenta)"
  theme[mem_box]="$(get_color green)"
  theme[net_box]="$(get_color red)"
  theme[proc_box]="$(get_color blue)"
  
  theme[div_line]="$(get_color muted)"
  
  theme[temp_start]="$(get_color green)"
  theme[temp_mid]="$(get_color yellow)"
  theme[temp_end]="$(get_color red)"
  
  theme[cpu_start]="$(get_color cyan)"
  theme[cpu_mid]="$(get_color blue)"
  theme[cpu_end]="$(get_color magenta)"
  
  theme[free_start]="$(get_color magenta)"
  theme[free_mid]="$(get_color blue)"
  theme[free_end]="$(get_color accent)"
  
  theme[cached_start]="$(get_color cyan)"
  theme[cached_mid]="$(get_color blue)"
  theme[cached_end]="$(get_color magenta)"
  
  theme[available_start]="$(get_color orange)"
  theme[available_mid]="$(get_color red)"
  theme[available_end]="$(get_color red)"
  
  theme[used_start]="$(get_color green)"
  theme[used_mid]="$(get_color cyan)"
  theme[used_end]="$(get_color blue)"
  
  theme[download_start]="$(get_color orange)"
  theme[download_mid]="$(get_color red)"
  theme[download_end]="$(get_color red)"
  
  theme[upload_start]="$(get_color green)"
  theme[upload_mid]="$(get_color cyan)"
  theme[upload_end]="$(get_color blue)"
  
  theme[process_start]="$(get_color cyan)"
  theme[process_mid]="$(get_color blue)"
  theme[process_end]="$(get_color magenta)"
EOF

  # for BTOP substitute the theme value with sed in the file itself
  sed -i \
    "s/^color_theme = .*/color_theme = \"$THEME\"/" \
    "$HOME/.config/btop/btop.conf"

  # GNOME
  if [ -f "$THEME_DIR/gnome.sh" ]; then
    source "$THEME_DIR/gnome.sh"
  fi

  # Tophat
  gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(get_color magenta)"

  # Ghostty
  # Not all themes are available in ghostty, so first we check if the theme is available
  # if not we keep it as is
  if ghostty +list-themes 2>/dev/null | grep -Fxq "$THEME"; then
    sed -i \
      "s/^theme = .*/theme = $THEME/" \
      "$HOME/.config/ghostty/config"
  fi

  source "$MERADEB_PATH/bin/meradeb-sub/set-gnome-theme.sh"
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"

elif [ "$THEME" == "<<-back" ]; then
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
fi
