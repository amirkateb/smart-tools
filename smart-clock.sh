#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

current_tz=$(timedatectl | grep "Time zone" | awk '{print $3}')
current_time=$(timedatectl | grep "Local time" | awk '{$1=""; print $0}' | sed 's/^ *//')

echo ""
echo -e "${YELLOW}🕒 Smart Timezone Setup${NC}"
echo "============================="
echo -e "📌 Current timezone: ${YELLOW}$current_tz${NC}"
echo -e "⏰ Local time:       ${YELLOW}$current_time${NC}"
echo "============================="
echo "1) 🇮🇷 Set Timezone to Iran (Asia/Tehran)"
echo "2) 🇺🇸 Set Timezone to USA (America/New_York)"
echo "3) 🇩🇪 Set Timezone to Germany (Europe/Berlin)"
echo "4) ✍️  Enter Custom Timezone"
echo "5) ❌ Cancel"
echo "============================="

read -p "Select an option [1-5]: " choice

case "$choice" in
  1)
    sudo timedatectl set-timezone Asia/Tehran
    echo -e "${YELLOW}✅ Timezone set to Asia/Tehran${NC}"
    ;;
  2)
    sudo timedatectl set-timezone America/New_York
    echo -e "${YELLOW}✅ Timezone set to America/New_York${NC}"
    ;;
  3)
    sudo timedatectl set-timezone Europe/Berlin
    echo -e "${YELLOW}✅ Timezone set to Europe/Berlin${NC}"
    ;;
  4)
    read -p "Enter timezone (e.g. Asia/Tehran): " tz
    if timedatectl list-timezones | grep -qx "$tz"; then
      sudo timedatectl set-timezone "$tz"
      echo -e "${YELLOW}✅ Timezone set to $tz${NC}"
    else
      echo "❌ Invalid timezone: $tz"
    fi
    ;;
  5)
    echo "❌ Cancelled."
    ;;
  *)
    echo "❌ Invalid option."
    ;;
esac

echo ""
echo "📋 Updated time status:"
timedatectl | grep -E "Time zone|Local time"

# 🔄 برگشت به منوی اصلی
echo ""
echo -e "${YELLOW}↩️  Press any key to return to main menu...${NC}"
read -n 1 -s