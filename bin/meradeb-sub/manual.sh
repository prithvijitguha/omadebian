#!/bin/bash

cd "$MERADEB_PATH" || exit 1

uv venv

source .venv/bin/activate && uv sync --group dev

mkdocs serve \
  --dev-addr 127.0.0.1:8080 \
  >/dev/null 2>&1 &

chromium \
  --app="http://127.0.0.1:8080/" \
  --name=Manual \
  --class=Manual \
  &>/dev/null &

source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
