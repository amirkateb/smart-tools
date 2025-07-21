#!/bin/bash

echo "🌐 Network Overview"
echo "==================="

echo ""
echo "📡 External IP:"
curl -s ifconfig.me

echo ""
echo "🔌 Default Gateway & Interface:"
ip route | grep default

echo ""
echo "🛠️  Current DNS Configuration:"
resolvectl status | grep -A2 'DNS Servers'

echo ""
echo "📶 Testing Internet Connectivity:"
ping -c 1 1.1.1.1 >/dev/null && echo "✅ Ping to 1.1.1.1 successful" || echo "❌ Ping failed"

echo ""
echo "🌍 Traceroute to google.com:"
traceroute -m 5 google.com

echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s