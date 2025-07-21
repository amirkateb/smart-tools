#!/bin/bash

echo "📦 Checking Installed Packages by Size"
echo "======================================"
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n -r | head -n 20 | awk '{printf "📦 %-40s %5s MB\n", $2, int($1/1024)}'

echo ""
echo "🔄 Checking for Outdated Packages"
echo "================================="
sudo apt update -y > /dev/null
apt list --upgradable 2>/dev/null | grep -v "Listing..." || echo "✅ All packages are up-to-date"
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s