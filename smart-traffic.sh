#!/bin/bash

# Check if vnstat is installed
if ! command -v vnstat &>/dev/null; then
  echo "📦 Installing vnstat..."
  sudo apt update -y && sudo apt install -y vnstat
fi

echo "📈 Network Traffic (5 seconds sample)"
echo "====================================="
vnstat -tr 5

echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s