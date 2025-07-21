#!/bin/bash


if ! command -v fail2ban-client &>/dev/null; then
  echo "📦 Installing fail2ban..."
  sudo apt update -y && sudo apt install -y fail2ban
fi

echo "🔐 Fail2Ban Status"
echo "=================="
sudo systemctl enable --now fail2ban
sudo fail2ban-client status
