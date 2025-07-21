#!/bin/bash
set -euo pipefail

echo "🔧 Starting safe cleanup process..."
df -h /

echo "🧹 Cleaning APT cache and unused packages..."
sudo apt clean -y
sudo apt autoclean -y
sudo apt autoremove -y

echo "🧹 Cleaning old journal logs..."
sudo journalctl --vacuum-time=7d

echo "🧹 Cleaning log files..."
sudo find /var/log -type f -name "*.gz" -delete
sudo find /var/log -type f -name "*.log" -size +100M -exec truncate -s 0 {} \;

echo "🧹 Cleaning temp files..."
sudo find /tmp -type f -atime +5 -delete
sudo find /var/tmp -type f -atime +5 -delete

echo "🧹 Removing man, locale, doc files..."
sudo rm -rf /usr/share/man/*
sudo rm -rf /usr/share/doc/*
sudo rm -rf /usr/share/locale/*

echo "🧹 Removing old Snap versions..."
snap list --all | awk '/disabled/{print $1, $2}' | while read snapname revision; do
  echo "   🔻 Removing $snapname ($revision)"
  sudo snap remove "$snapname" --revision="$revision"
done

echo "📦 Top 10 big files (500MB+):"
sudo find / -type f -size +500M -exec ls -lh {} \; 2>/dev/null | sort -k 5 -hr | head -n 10

df -h /
echo "✅ Cleanup completed!"
