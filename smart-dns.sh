#!/bin/bash

domain="$1"

if [[ -z "$domain" ]]; then
  echo "❌ Usage: smart-dns <domain>"
  exit 1
fi

dns_list=(
  178.22.122.100 185.51.200.2
  1.1.1.1 1.0.0.1
  8.8.8.8 8.8.4.4
  9.9.9.9 149.112.112.112
  208.67.222.222 208.67.220.220
  94.140.14.14 94.140.15.15
  185.228.168.168 185.228.169.168
  185.222.222.222 45.11.45.11
  95.85.95.85 2.56.220.2
  77.88.8.8 77.88.8.1
  4.2.2.1 4.2.2.2
  74.82.42.42
  8.26.56.26 8.20.247.20
)

echo "⏳ Testing DNS latency for $domain..."
fastest_dns=""
fastest_time=9999

for dns in "${dns_list[@]}"; do
  if out=$(dig @"$dns" "$domain" +stats +noanswer 2>/dev/null | grep "Query time"); then
    t=$(echo "$out" | grep -oP '[0-9]+')
    printf "  %-16s → %4d ms\n" "$dns" "$t"
    if (( t < fastest_time )); then
      fastest_time=$t
      fastest_dns=$dns
    fi
  else
    printf "  %-16s → FAILED\n" "$dns"
  fi
done

[[ -z "$fastest_dns" ]] && { echo "❌ No DNS responded"; exit 1; }

fallback_dns="185.51.200.2"
iface=$(ip route get 1 | awk 'NR==1{print $5}')

echo -e "\n🧹 Clearing all previous DNS settings..."
resolvectl dns '' >/dev/null
resolvectl domain '' '' >/dev/null

for link in $(resolvectl --no-pager status | awk '/^Link [0-9]+/ {print $2}'); do
  resolvectl dns "$link" '' >/dev/null
  resolvectl domain "$link" '' >/dev/null
done
resolvectl flush-caches

echo "✅ Applying $fastest_dns (fallback $fallback_dns) on $iface"
resolvectl dns "$iface" "$fastest_dns" "$fallback_dns"
resolvectl domain "$iface" ''
resolvectl flush-caches

echo -e "\n📋 Current DNS configuration:"
resolvectl status | grep -A2 'DNS Servers'