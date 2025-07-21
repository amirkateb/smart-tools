#!/bin/bash

echo ""
echo "📦 Installing Smart Server Tools..."
echo "==================================="

# لیست فایل‌های اجرایی
FILES=(
  cleanup.sh
  smart-dns.sh
  check-reality.sh
  smart-cron.sh
  smart-status.sh
  smart-net.sh
  smart-ping.sh
  smart-ports.sh
  smart-updater.sh
  smart-traffic.sh
  smart-speed.sh
  smart-fail2ban.sh
  smart-secure.sh
  smart-sshkey-check.sh
  smart-packages.sh
  smart-clock.sh
  smart-users.sh
  smart-ssh-harden.sh
  smart-ip-checkhost.sh
  menu.sh
  domains.txt
)

# مسیر نصب
BIN_DIR="/usr/local/bin"

# کپی ابزارها با نام مناسب
echo "📁 Copying scripts to $BIN_DIR..."
sudo cp cleanup.sh             $BIN_DIR/cleanup-ultra
sudo cp smart-dns.sh           $BIN_DIR/smart-dns
sudo cp check-reality.sh       $BIN_DIR/check-reality
sudo cp smart-cron.sh          $BIN_DIR/smart-cron
sudo cp smart-status.sh        $BIN_DIR/smart-status
sudo cp smart-net.sh           $BIN_DIR/smart-net
sudo cp smart-ping.sh          $BIN_DIR/smart-ping
sudo cp smart-ports.sh         $BIN_DIR/smart-ports
sudo cp smart-updater.sh       $BIN_DIR/smart-updater
sudo cp smart-traffic.sh       $BIN_DIR/smart-traffic
sudo cp smart-speed.sh         $BIN_DIR/smart-speed
sudo cp smart-fail2ban.sh      $BIN_DIR/smart-fail2ban
sudo cp smart-secure.sh        $BIN_DIR/smart-secure
sudo cp smart-sshkey-check.sh  $BIN_DIR/smart-sshkey-check
sudo cp smart-packages.sh      $BIN_DIR/smart-packages
sudo cp smart-clock.sh         $BIN_DIR/smart-clock
sudo cp smart-users.sh         $BIN_DIR/smart-users
sudo cp smart-ssh-harden.sh    $BIN_DIR/smart-ssh-harden
sudo cp smart-ip-checkhost.sh  $BIN_DIR/smart-ip-checkhost
sudo cp menu.sh                $BIN_DIR/smart-tools

# کپی فایل دامنه‌ها
echo "📁 Copying domains.txt to $BIN_DIR/domains.txt..."
sudo cp domains.txt $BIN_DIR/domains.txt

# تنظیم پرمیشن اجرایی برای همه ابزارها
echo "🔐 Setting executable permissions..."
for tool in cleanup-ultra smart-dns check-reality smart-cron \
            smart-status smart-net smart-ping smart-ports smart-updater \
            smart-traffic smart-speed smart-fail2ban smart-secure \
            smart-sshkey-check smart-packages smart-clock smart-users \
            smart-ssh-harden smart-ip-checkhost smart-tools
do
  sudo chmod +x "$BIN_DIR/$tool"
done

# پیام نهایی
echo ""
echo "✅ Installation complete!"
echo "🚀 You can now run the toolkit with:"
echo ""
echo "    smart-tools"
echo ""
echo "🎯 Tools installed:"
for tool in cleanup-ultra smart-dns check-reality smart-cron \
            smart-status smart-net smart-ping smart-ports smart-updater \
            smart-traffic smart-speed smart-fail2ban smart-secure \
            smart-sshkey-check smart-packages smart-clock smart-users \
            smart-ssh-harden smart-ip-checkhost
do
  echo "    • $tool"
done
echo ""