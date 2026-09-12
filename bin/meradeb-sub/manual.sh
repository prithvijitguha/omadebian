#!/bin/bash

cd "$MERADEB_PATH" || exit 1

# We add /dev/null stuff to keep uv quite,
# otherwise adds a lot of logs to the terminal
if [ ! -d ".venv" ]; then
  uv venv >/dev/null 2>&1
fi

if [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
  uv sync --group dev >/dev/null 2>&1
fi

mkdocs serve \
  --dev-addr 127.0.0.1:8080 \
  >/dev/null 2>&1 &

chromium \
  --app="http://127.0.0.1:8080/" \
  --name=Manual \
  --class=Manual \
  &>/dev/null &

source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
