#!/bin/bash

echo ""
echo "🗑️  Uninstalling Smart Server Tools..."
echo "======================================"

BIN_DIR="/usr/local/bin"
FILES=(
  cleanup-ultra smart-dns check-reality smart-cron smart-status smart-net
  smart-ping smart-ports smart-updater smart-traffic smart-speed
  smart-fail2ban smart-secure smart-sshkey-check smart-packages
  smart-clock smart-users smart-ssh-harden smart-ip-checkhost smart-tools
)

for file in "${FILES[@]}"; do
  if [[ -f "$BIN_DIR/$file" ]]; then
    sudo rm -f "$BIN_DIR/$file"
    echo "❌ Removed: $file"
  fi
done

if [[ -f "$BIN_DIR/domains.txt" ]]; then
  sudo rm -f "$BIN_DIR/domains.txt"
  echo "❌ Removed: domains.txt"
fi

echo ""
echo "✅ Uninstall complete!"