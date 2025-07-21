#!/bin/bash

echo "📦 Updating System Packages..."
sudo apt update && sudo apt upgrade -y

echo ""
echo "🚀 Updating Smart Tools (if Git repo present)..."

# اگر داخل گیت هست
if [ -d .git ]; then
  git pull
  sudo bash install.sh
  echo "✅ Smart Tools updated from GitHub."
else
  echo "⚠️ Not a git repo. Please update manually."
fi

echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s