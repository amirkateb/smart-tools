#!/bin/bash

YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}🌍 IP Check via check-host.net${NC}"
echo "======================================="
read -p "Enter IP or domain to test (default: current server IP): " target

if [[ -z "$target" ]]; then
  target=$(curl -s https://ipinfo.io/ip)
  echo -e "📡 Using current IP: ${GREEN}$target${NC}"
fi

echo ""
echo "1) 🛰️ Ping Test"
echo "2) 🌐 HTTP Test"
echo "3) 🔌 TCP Port Test (port 443)"
echo "4) ❌ Cancel"
echo "============================="
read -p "Select a test [1-4]: " test_type

case "$test_type" in
  1)
    type="ping"
    ;;
  2)
    type="http"
    ;;
  3)
    type="tcp"
    target="$target:443"
    ;;
  4)
    echo "❌ Cancelled."
    exit 0
    ;;
  *)
    echo "❌ Invalid option."
    exit 1
    ;;
esac

echo -e "\n⏳ Requesting test from check-host.net..."
rid=$(curl -s "https://check-host.net/check-$type?host=$target" | jq -r '.request_id')

if [[ -z "$rid" || "$rid" == "null" ]]; then
  echo -e "${RED}❌ Failed to get request ID${NC}"
  exit 1
fi

sleep 3

echo -e "${YELLOW}📊 Fetching results...${NC}"
resp=$(curl -s "https://check-host.net/check-result/$rid")

echo ""
echo -e "${GREEN}📍 Results:${NC}"
echo "$resp" | jq -r 'to_entries[] | "\(.key): \(.value | .[0] // "N/A")"' | while read line; do
  if [[ "$line" == *"null"* || "$line" == *"N/A"* ]]; then
    echo -e "${RED}❌ $line${NC}"
  else
    echo -e "${GREEN}✅ $line${NC}"
  fi
done

# 🔄 برگشت به منوی اصلی
echo ""
echo -e "${YELLOW}↩️  Press any key to return to main menu...${NC}"
read -n 1 -s