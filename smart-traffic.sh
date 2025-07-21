#!/bin/bash

# Check if vnstat is installed
if ! command -v vnstat &>/dev/null; then
  echo "📦 Installing vnstat..."
  sudo apt update -y && sudo apt install -y vnstat
fi

echo "📈 Network Traffic (5 seconds sample)"
echo "====================================="
vnstat -tr 5