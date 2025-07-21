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
  menu.sh
  domains.txt
)

# کپی ابزارها به /usr/local/bin
echo "📁 Copying scripts to /usr/local/bin..."
sudo cp cleanup.sh /usr/local/bin/cleanup-ultra
sudo cp smart-dns.sh /usr/local/bin/smart-dns
sudo cp check-reality.sh /usr/local/bin/check-reality
sudo cp smart-cron.sh /usr/local/bin/smart-cron
sudo cp menu.sh /usr/local/bin/smart-tools

# کپی لیست دامنه‌ها
echo "📁 Copying domains.txt to /usr/local/bin/domains.txt..."
sudo cp domains.txt /usr/local/bin/domains.txt

# تنظیم پرمیشن اجرایی
echo "🔐 Setting executable permissions..."
sudo chmod +x /usr/local/bin/cleanup-ultra
sudo chmod +x /usr/local/bin/smart-dns
sudo chmod +x /usr/local/bin/check-reality
sudo chmod +x /usr/local/bin/smart-cron
sudo chmod +x /usr/local/bin/smart-tools

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
echo ""