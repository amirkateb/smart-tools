#!/bin/bash

echo "🧠 System Status Overview"
echo "========================="
echo ""
echo "📊 CPU & Load:"
uptime

echo ""
echo "💾 Memory:"
free -h

echo ""
echo "💽 Disk Usage (root):"
df -h /

echo ""
echo "📦 Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s