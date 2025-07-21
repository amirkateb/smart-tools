#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m'
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.bak.$(date +%F-%H%M%S)"

echo -e "\n${YELLOW}🔐 SSH Hardening Tool${NC}"
echo "==================================="
echo "📁 Backing up SSH config to $BACKUP"
sudo cp "$SSH_CONFIG" "$BACKUP"

echo "==================================="
echo "1) 🚫 Disable root login"
echo "2) 🔀 Change SSH port"
echo "3) 🔐 Enable key-only login (disable password)"
echo "4) 👤 Allow only specific users"
echo "5) ❌ Exit"
echo "==================================="

read -p "Select an option [1-5]: " choice

case "$choice" in
  1)
    sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG"
    echo -e "${YELLOW}✅ Root login disabled${NC}"
    ;;
  2)
    read -p "Enter new SSH port (e.g. 2222): " new_port
    sudo sed -i "s/^#*Port .*/Port $new_port/" "$SSH_CONFIG"
    echo -e "${YELLOW}✅ SSH port set to $new_port${NC}"
    ;;
  3)
    sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG"
    sudo sed -i 's/^#*ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' "$SSH_CONFIG"
    echo -e "${YELLOW}✅ Password login disabled, key-only login enabled${NC}"
    ;;
  4)
    read -p "Enter allowed usernames (space-separated): " users
    sudo sed -i '/^AllowUsers/d' "$SSH_CONFIG"
    echo "AllowUsers $users" | sudo tee -a "$SSH_CONFIG" >/dev/null
    echo -e "${YELLOW}✅ SSH access limited to: $users${NC}"
    ;;
  5)
    echo "❌ Cancelled."
    exit 0
    ;;
  *)
    echo "❌ Invalid option."
    exit 1
    ;;
esac

echo -e "\n🔄 Restarting SSH service..."
sudo systemctl restart ssh
echo -e "${YELLOW}✅ SSH config updated and service restarted.${NC}"

echo ""
