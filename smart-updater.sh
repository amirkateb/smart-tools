#!/bin/bash

REPO_URL="https://github.com/amirkateb/smart-tools.git"
INSTALL_DIR="$HOME/.smart-tools"

echo "📦 Updating System Packages..."
sudo apt update && sudo apt upgrade -y

echo ""
echo "🚀 Checking for Smart Tools updates..."

if [ ! -d "$INSTALL_DIR" ]; then
  echo "📥 Cloning Smart Tools..."
  git clone "$REPO_URL" "$INSTALL_DIR"
else
  echo "🔁 Pulling latest changes..."
  cd "$INSTALL_DIR" || { echo "❌ Failed to enter $INSTALL_DIR"; exit 1; }
  git pull
fi

echo ""
echo "⚙️ Reinstalling Smart Tools..."
cd "$INSTALL_DIR" || exit 1
sudo bash install.sh

# نسخه رو از فایل VERSION بگیر (اگر هست)
if [ -f "$INSTALL_DIR/VERSION" ]; then
  VERSION=$(cat "$INSTALL_DIR/VERSION")
  echo -e "\n✅ Smart Tools updated to version \033[1;32m$VERSION\033[0m"
else
  echo -e "\n✅ Smart Tools updated successfully."
fi