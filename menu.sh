#!/bin/bash

while true; do
  echo ""
  echo "🧠 Smart Server Tools"
  echo "============================="
  echo "1) 🧹 Run System Cleanup"
  echo "2) 🌐 Run Smart DNS Selector"
  echo "3) 🛰️  Find Best Domain for Reality"
  echo "4) ⏰ Schedule Auto Tasks (smart-dns / cleanup)"
  echo "5) 🧠 System Status Overview"
  echo "6) 🌐 Network Info & DNS"
  echo "7) 📶 Ping Iran & Global"
  echo "8) 🔓 Open Ports"
  echo "9) 🛠️  System & Tools Updater"
  echo "10) ❌ Exit"
  echo "============================="
  read -p "Select an option [1-10]: " choice

  case "$choice" in
    1)
      sudo cleanup-ultra
      ;;
    2)
      read -p "Enter a domain (e.g. api.kavenegar.com): " domain
      sudo smart-dns "$domain"
      ;;
    3)
      sudo check-reality
      ;;
    4)
      sudo smart-cron
      ;;
    5)
      sudo smart-status
      ;;
    6)
      sudo smart-net
      ;;
    7)
      sudo smart-ping
      ;;
    8)
      sudo smart-ports
      ;;
    9)
      sudo smart-updater
      ;;
    10)
      echo "👋 Goodbye!"
      exit 0
      ;;
    *)
      echo "❌ Invalid option. Try again."
      ;;
  esac
done