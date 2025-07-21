#!/bin/bash

YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

pause_return() {
  echo ""
  echo -e "${YELLOW}↩️  Press any key to return to main menu...${NC}"
  read -n 1 -s
}

main_menu() {
  while true; do
    clear
    echo -e "${CYAN}🧠 Smart Server Tools${NC}"
    echo -e "${YELLOW}Developed by AmirMohammad Kateb Saber${NC}"
    echo "=============================="
    echo "1) 🧹 System Maintenance"
    echo "2) 🌐 Network Tools"
    echo "3) 🔒 Security & Access"
    echo "4) 📦 Packages & Services"
    echo "5) ⚙️  Settings"
    echo "6) 📖 Help / About Tools"
    echo "7) 🗑️  Uninstall Smart Tools"
    echo "8) ❌ Exit"
    echo "=============================="
    read -p "Select an option [1-8]: " choice

    case "$choice" in
      1) system_maintenance ;;
      2) network_tools ;;
      3) security_access ;;
      4) packages_services ;;
      5) settings_menu ;;
      6) sudo smart-help ;;
      7) sudo uninstall-smart-tools ;;
      8) echo "👋 Goodbye!"; exit 0 ;;
      *) echo "❌ Invalid option. Try again." ; sleep 1 ;;
    esac
  done
}

system_maintenance() {
  clear
  echo "🧹 System Maintenance"
  echo "------------------------------"
  echo "1) Run System Cleanup"
  echo "2) Schedule Auto Tasks"
  echo "3) Update System & Tools"
  echo "4) ↩️ Back to Main Menu"
  echo "------------------------------"
  read -p "Select an option [1-4]: " choice
  case "$choice" in
    1) sudo cleanup-ultra ;;
    2) sudo smart-cron ;;
    3) sudo smart-updater ;;
    4) return ;;
    *) echo "❌ Invalid option." ;;
  esac
  pause_return
}

network_tools() {
  clear
  echo "🌐 Network Tools"
  echo "------------------------------"
  echo "1) Smart DNS Selector"
  echo "2) Best Domain for Reality"
  echo "3) Ping Iran & Global"
  echo "4) Network Status & DNS"
  echo "5) Network Traffic Monitor"
  echo "6) Internet Speed Test"
  echo "7) IP Check via CheckHost"
  echo "8) ↩️ Back to Main Menu"
  echo "------------------------------"
  read -p "Select an option [1-8]: " choice
  case "$choice" in
    1) read -p "Enter a domain (e.g. api.kavenegar.com): " domain
       sudo smart-dns "$domain" ;;
    2) sudo check-reality ;;
    3) sudo smart-ping ;;
    4) sudo smart-net ;;
    5) sudo smart-traffic ;;
    6) sudo smart-speed ;;
    7) sudo smart-ip-checkhost ;;
    8) return ;;
    *) echo "❌ Invalid option." ;;
  esac
  pause_return
}

security_access() {
  clear
  echo "🔒 Security & Access"
  echo "------------------------------"
  echo "1) Fail2Ban Status"
  echo "2) SSH Key Check"
  echo "3) Harden SSH Configuration"
  echo "4) Server Security Scan"
  echo "5) ↩️ Back to Main Menu"
  echo "------------------------------"
  read -p "Select an option [1-5]: " choice
  case "$choice" in
    1) sudo smart-fail2ban ;;
    2) sudo smart-sshkey-check ;;
    3) sudo smart-ssh-harden ;;
    4) sudo smart-secure ;;
    5) return ;;
    *) echo "❌ Invalid option." ;;
  esac
  pause_return
}

packages_services() {
  clear
  echo "📦 Packages & Services"
  echo "------------------------------"
  echo "1) Installed & Old Packages"
  echo "2) Open Ports"
  echo "3) ↩️ Back to Main Menu"
  echo "------------------------------"
  read -p "Select an option [1-3]: " choice
  case "$choice" in
    1) sudo smart-packages ;;
    2) sudo smart-ports ;;
    3) return ;;
    *) echo "❌ Invalid option." ;;
  esac
  pause_return
}

settings_menu() {
  clear
  echo "⚙️  Settings"
  echo "------------------------------"
  echo "1) Set System Clock / Timezone"
  echo "2) List System Users"
  echo "3) ↩️ Back to Main Menu"
  echo "------------------------------"
  read -p "Select an option [1-3]: " choice
  case "$choice" in
    1) sudo smart-clock ;;
    2) sudo smart-users ;;
    3) return ;;
    *) echo "❌ Invalid option." ;;
  esac
  pause_return
}

main_menu