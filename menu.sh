#!/bin/bash

while true; do
  echo ""
  echo "🧠 Smart Server Tools"
  echo "=========================================="
  echo " 1)  🧹 Run System Cleanup"
  echo " 2)  🌐 Run Smart DNS Selector"
  echo " 3)  🛰️  Find Best Domain for Reality"
  echo " 4)  ⏰ Schedule Auto Tasks (smart-dns / cleanup)"
  echo " 5)  🧠 System Status Overview"
  echo " 6)  🌐 Network Info & DNS"
  echo " 7)  📶 Ping Iran & Global"
  echo " 8)  🔓 Open Ports"
  echo " 9)  🛠️  System & Tools Updater"
  echo "10) 🚦 Network Traffic Monitor"
  echo "11) 🚀 Internet Speed Test"
  echo "12) 🛡️  Fail2Ban Status"
  echo "13) 🔐 Server Security Check"
  echo "14) 🔑 SSH Key Presence Check"
  echo "15) 📦 Installed & Old Packages"
  echo "16) 🌍 IP Test via check-host.net"
  echo "17) 🕒 System Timezone Config"
  echo "18) 👥 Users & Security Info"
  echo "19) 🛡️ SSH Hardening Tool"
  echo "20) ❌ Exit"
  echo "=========================================="
  read -p "Select an option [1-20]: " choice

  case "$choice" in
    1)  sudo cleanup-ultra ;;
    2)  read -p "Enter a domain (e.g. api.kavenegar.com): " domain
        sudo smart-dns "$domain"
        ;;
    3)  sudo check-reality ;;
    4)  sudo smart-cron ;;
    5)  sudo smart-status ;;
    6)  sudo smart-net ;;
    7)  sudo smart-ping ;;
    8)  sudo smart-ports ;;
    9)  sudo smart-updater ;;
    10) sudo smart-traffic ;;
    11) sudo smart-speed ;;
    12) sudo smart-fail2ban ;;
    13) sudo smart-secure ;;
    14) sudo smart-sshkey-check ;;
    15) sudo smart-packages ;;
    16) sudo smart-ip-checkhost ;;
    17) sudo smart-clock ;;
    18) sudo smart-users ;;
    19) sudo smart-ssh-harden ;;
    20) echo "👋 Goodbye!"
         exit 0
         ;;
    *)  echo "❌ Invalid option. Try again." ;;
  esac
done