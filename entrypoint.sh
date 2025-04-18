#!/bin/bash

set -e

# Запускаем виртуальный X сервер
Xvfb :99 -screen 0 1024x768x16 &
export DISPLAY=:99

echo "== Exporting .drawio files =="

find /workspace -name "*.drawio" | while read file; do
  base="${file%.drawio}"
  echo "→ $file"
  drawio --export "$file" --output "${base}.drawio.png" --format png
  drawio --export "$file" --output "${base}.drawio.svg" --format svg
done
