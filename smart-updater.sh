#!/bin/bash

echo "📦 Updating System Packages..."
sudo apt update && sudo apt upgrade -y

echo ""
echo "🚀 Updating Smart Tools (if Git repo present)..."

if [ -d .git ]; then
  git pull
  sudo bash install.sh
  echo "✅ Smart Tools updated from GitHub."
else
  echo "⚠️ Not a git repo. Please update manually."
fi
