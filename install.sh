#!/bin/bash

echo "📦 Installing Smart Server Tools..."

# نصب اسکریپت‌ها
sudo cp cleanup.sh /usr/local/bin/cleanup-ultra
sudo cp smart-dns.sh /usr/local/bin/smart-dns
sudo cp check-reality.sh /usr/local/bin/check-reality
sudo cp menu.sh /usr/local/bin/smart-tools
sudo cp domains.txt /usr/local/bin/domains.txt

# پرمیشن اجرایی
sudo chmod +x /usr/local/bin/cleanup-ultra
sudo chmod +x /usr/local/bin/smart-dns
sudo chmod +x /usr/local/bin/check-reality
sudo chmod +x /usr/local/bin/smart-tools

echo "✅ Installation complete!"
echo "👉 Run with: smart-tools"