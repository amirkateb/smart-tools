#!/bin/bash

REPO="amirkateb/smart-tools"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"

echo ""
echo -e "\033[1;36m🚀 Smart Server Tools Installer\033[0m"
echo -e "\033[1;34mDeveloped by AmirMohammad Kateb Saber\033[0m"
echo "==================================="
echo ""
echo "📦 Installing Smart Server Tools..."
echo "==================================="


declare -A TOOLS=(
  [cleanup-ultra]="cleanup.sh"
  [smart-dns]="smart-dns.sh"
  [check-reality]="check-reality.sh"
  [smart-cron]="smart-cron.sh"
  [smart-status]="smart-status.sh"
  [smart-net]="smart-net.sh"
  [smart-ping]="smart-ping.sh"
  [smart-ports]="smart-ports.sh"
  [smart-updater]="smart-updater.sh"
  [smart-traffic]="smart-traffic.sh"
  [smart-speed]="smart-speed.sh"
  [smart-fail2ban]="smart-fail2ban.sh"
  [smart-secure]="smart-secure.sh"
  [smart-sshkey-check]="smart-sshkey-check.sh"
  [smart-packages]="smart-packages.sh"
  [smart-clock]="smart-clock.sh"
  [smart-users]="smart-users.sh"
  [smart-ssh-harden]="smart-ssh-harden.sh"
  [smart-ip-checkhost]="smart-ip-checkhost.sh"
  [smart-help]="smart-help.sh"
  [uninstall-smart-tools]="uninstall.sh"
  [smart-tools]="menu.sh"
)


BIN_DIR="/usr/local/bin"

echo "📁 Downloading and installing scripts..."
for name in "${!TOOLS[@]}"; do
  url="$BASE_URL/${TOOLS[$name]}"
  dest="$BIN_DIR/$name"
  echo "⬇️  $name ← $url"
  sudo curl -sSL "$url" -o "$dest"
  sudo chmod +x "$dest"
done


echo "📁 Downloading domains.txt..."
sudo curl -sSL "$BASE_URL/domains.txt" -o "$BIN_DIR/domains.txt"

echo ""
echo "✅ Installation complete!"
echo "🚀 Run the toolkit with:"
echo ""
echo "    smart-tools"
echo ""
echo "🎯 Tools installed:"
for tool in "${!TOOLS[@]}"; do
  echo "    • $tool"
done
echo ""