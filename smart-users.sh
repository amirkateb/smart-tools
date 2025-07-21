#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "\n${YELLOW}👥 User Account Overview${NC}"
echo "==================================="
echo "📂 All local users:"
cut -d: -f1 /etc/passwd | sort
echo "-----------------------------------"

echo "🔐 Users with sudo privileges:"
getent group sudo | cut -d: -f4
echo "-----------------------------------"

echo "🚫 Users with nologin/false shell:"
grep -E '/nologin|/false' /etc/passwd | cut -d: -f1
echo "-----------------------------------"

echo "📆 Last login info:"
lastlog | grep -v "Never" | head -n 10
echo "-----------------------------------"

echo "⚠️ Suspicious users (no login recorded):"
lastlog | grep "Never" | awk '{print $1}'
echo "==================================="

# 🔄 برگشت به منوی اصلی
echo ""
echo -e "${YELLOW}↩️  Press any key to return to main menu...${NC}"
read -n 1 -s