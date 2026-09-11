#!/bin/bash

set -e

ascii_art='
███╗   ███╗███████╗██████╗  █████╗ ██████╗ ███████╗██████╗ 
████╗ ████║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██╔████╔██║█████╗  ██████╔╝███████║██║  ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║██║  ██║██╔══╝  ██╔══██╗
██║ ╚═╝ ██║███████╗██║  ██║██║  ██║██████╔╝███████╗██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ 
'

# Define the color gradient (shades of cyan and blue)
colors=(
  '\033[38;5;81m' # Cyan
  '\033[38;5;75m' # Light Blue
  '\033[38;5;69m' # Sky Blue
  '\033[38;5;63m' # Dodger Blue
  '\033[38;5;57m' # Deep Sky Blue
  '\033[38;5;51m' # Cornflower Blue
  '\033[38;5;45m' # Royal Blue
)
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art" || true

echo ""
echo ""
# Split the ASCII art into lines
# Print each line with the corresponding color
for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}\033[0m"
done
echo "=> Warning: Meradeb is recommeded for Debian 13 Trixie setups"
echo -e "\nBegin installation (or abort with ctrl+c)..."

echo "Cloning Meradeb..."
rm -rf ~/.local/share/meradeb
git clone git@github.com:prithvijitguha/meradeb.git ~/.local/share/meradeb >/dev/null
if [[ $MERADEB_REF != "master" ]]; then
  cd ~/.local/share/meradeb
  git fetch origin "${MERADEB_REF:-stable}" && git checkout "${MERADEB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/meradeb/install.sh
