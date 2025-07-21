#!/bin/bash

echo "🔓 Open Listening Ports"
echo "========================"
sudo ss -tulnp | grep LISTEN || sudo netstat -tulnp | grep LISTEN
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s