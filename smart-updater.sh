#!/bin/bash

REPO_URL="https://github.com/amirkateb/smart-tools.git"
INSTALL_DIR="$HOME/.smart-tools"

echo ""
echo -e "\033[1;36m📦 Updating System Packages...\033[0m"
sudo apt update && sudo apt upgrade -y

echo ""
echo -e "\033[1;36m🚀 Smart Tools Auto Updater\033[0m"
echo -e "\033[1;34mChecking for the latest version...\033[0m"
echo ""

# Run the official install.sh from GitHub
bash <(curl -sSL https://raw.githubusercontent.com/amirkateb/smart-tools/main/install.sh)

# Show version if available
VERSION=$(curl -sSL https://raw.githubusercontent.com/amirkateb/smart-tools/main/VERSION)
if [[ -n "$VERSION" ]]; then
  echo -e "\n✅ Updated to version \033[1;32m$VERSION\033[0m"
else
  echo -e "\n✅ Smart Tools updated successfully."
fi
