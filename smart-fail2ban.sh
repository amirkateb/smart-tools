#!/bin/bash

# Check and install fail2ban if not installed
if ! command -v fail2ban-client &>/dev/null; then
  echo "📦 Installing fail2ban..."
  sudo apt update -y && sudo apt install -y fail2ban
fi

echo "🔐 Fail2Ban Status"
echo "=================="
sudo systemctl enable --now fail2ban
sudo fail2ban-client status
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s