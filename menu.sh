#!/bin/bash

while true; do
  echo ""
  echo "🧠 Smart Server Tools"
  echo "============================="
  echo "1) 🧹 Run System Cleanup"
  echo "2) 🌐 Run Smart DNS Selector"
  echo "3) 🛰️  Find Best Domain for Reality"
  echo "4) ⏰ Schedule Auto Tasks (smart-dns / cleanup)"
  echo "5) ❌ Exit"
  echo "============================="
  read -p "Select an option [1-5]: " choice

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
      echo "👋 Goodbye!"
      exit 0
      ;;
    *)
      echo "❌ Invalid option. Try again."
      ;;
  esac
done