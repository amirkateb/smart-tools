#!/bin/bash

echo "📶 Smart Ping Test (Iran vs Global)"
echo "==================================="

DOMAINS_IR=("digikala.com" "aparat.com" "zoomit.ir" "irna.ir" "farsnews.ir")
DOMAINS_GLOBAL=("google.com" "cloudflare.com" "github.com" "wikipedia.org" "openai.com")

echo ""
echo "🇮🇷 Iranian Domains:"
for domain in "${DOMAINS_IR[@]}"; do
  ping -c 1 -W 1 $domain | grep "time=" || echo "❌ $domain unreachable"
done

echo ""
echo "🌍 Global Domains:"
for domain in "${DOMAINS_GLOBAL[@]}"; do
  ping -c 1 -W 1 $domain | grep "time=" || echo "❌ $domain unreachable"
done