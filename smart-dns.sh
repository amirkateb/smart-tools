#!/bin/bash

domain="$1"

if [[ -z "$domain" ]]; then
  echo "❌ Usage: smart-dns <domain>"
  exit 1
fi

dns_list=(
  # Google Public DNS
  8.8.8.8 8.8.4.4

  # Cloudflare
  1.1.1.1 1.0.0.1

  # Quad9
  9.9.9.9 149.112.112.112

  # OpenDNS
  208.67.222.222 208.67.220.220

  # G-Core Labs
  95.85.95.85 2.56.220.2

  # Yandex DNS
  77.88.8.8 77.88.8.1

  # OpenNIC
  134.195.4.2

  # DNS.SB
  185.222.222.222 45.11.45.11

  # Verisign
  64.6.64.6 64.6.65.6

  # Freenom World
  80.80.80.80 80.80.81.81

  # Comodo Secure DNS
  8.26.56.26 8.20.247.20

  # Alternate DNS
  198.101.242.72 23.253.163.53

  # DNS.WATCH
  84.200.69.80 84.200.70.40

  # SafeDNS
  195.46.39.39 195.46.39.40

  # UncensoredDNS
  91.239.100.100 89.233.43.71

  # Hurricane Electric
  74.82.42.42

  # Neustar DNS Advantage
  156.154.70.1 156.154.71.1

  # 114DNS (China)
  114.114.114.114 114.114.115.115

  # AliDNS (Alibaba)
  223.5.5.5 223.6.6.6

  # Baidu DNS
  180.76.76.76

  # DNSPod (Tencent)
  119.29.29.29 119.28.28.28

  # ————————————
  # 🇮🇷 Iranian DNS Servers
  178.22.122.100 185.51.200.50       # Shahrad
  185.51.200.10                      # Sefroyek
  2.188.21.130 2.188.21.131 2.188.21.132  # Irancell
  2.189.44.44                        # Rightel/ICS
  37.156.145.21 37.156.145.229       # Asiatech
  80.191.40.41                       # ParsOnline
  194.225.73.141 194.225.62.80       # NIC.ir
  85.185.157.2                       # TICP Yazd
  213.176.123.5                      # IROST
  217.218.155.155                    # Mobinnet
  81.91.144.116                      # Afranet
  91.245.229.1                       # Respina
  92.119.56.162                      # ParsDatacenter
  91.99.101.12                       # Shatel
  185.187.84.15                      # HostIran
  185.231.182.126                    # TCI
  185.97.117.187                     # Netmihan
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
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s