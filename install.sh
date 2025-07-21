#!/bin/bash

echo ""
echo "📦 Installing Smart Server Tools..."
echo "==================================="

# فایل‌های اصلی
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
  menu.sh
  domains.txt
)

# کپی ابزارها به /usr/local/bin
echo "📁 Copying scripts to /usr/local/bin..."
sudo cp cleanup.sh /usr/local/bin/cleanup-ultra
sudo cp smart-dns.sh /usr/local/bin/smart-dns
sudo cp check-reality.sh /usr/local/bin/check-reality
sudo cp smart-cron.sh /usr/local/bin/smart-cron
sudo cp smart-status.sh /usr/local/bin/smart-status
sudo cp smart-net.sh /usr/local/bin/smart-net
sudo cp smart-ping.sh /usr/local/bin/smart-ping
sudo cp smart-ports.sh /usr/local/bin/smart-ports
sudo cp smart-updater.sh /usr/local/bin/smart-updater
sudo cp menu.sh /usr/local/bin/smart-tools

# کپی لیست دامنه‌ها
echo "📁 Copying domains.txt to /usr/local/bin/domains.txt..."
sudo cp domains.txt /usr/local/bin/domains.txt

# تنظیم پرمیشن اجرایی
echo "🔐 Setting executable permissions..."
for file in /usr/local/bin/cleanup-ultra \
            /usr/local/bin/smart-dns \
            /usr/local/bin/check-reality \
            /usr/local/bin/smart-cron \
            /usr/local/bin/smart-status \
            /usr/local/bin/smart-net \
            /usr/local/bin/smart-ping \
            /usr/local/bin/smart-ports \
            /usr/local/bin/smart-updater \
            /usr/local/bin/smart-tools
do
  sudo chmod +x "$file"
done

# نمایش راهنمای اجرا
echo ""
echo "✅ Installation complete!"
echo "🚀 You can now run the toolkit with:"
echo ""
echo "    smart-tools"
echo ""
echo "🎯 Tools installed:"
echo "    • cleanup-ultra"
echo "    • smart-dns"
echo "    • check-reality"
echo "    • smart-cron"
echo "    • smart-status"
echo "    • smart-net"
echo "    • smart-ping"
echo "    • smart-ports"
echo "    • smart-updater"
echo ""