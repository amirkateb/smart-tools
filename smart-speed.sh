#!/bin/bash

# Check if speedtest-cli is installed
if ! command -v speedtest &>/dev/null; then
  echo "📦 Installing speedtest-cli..."
  sudo apt update -y && sudo apt install -y speedtest-cli
fi

echo "🚀 Running Speed Test..."
echo "========================"
speedtest --simple
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s