#!/bin/bash

# Check if speedtest-cli is installed
if ! command -v speedtest &>/dev/null; then
  echo "📦 Installing speedtest-cli..."
  sudo apt update -y && sudo apt install -y speedtest-cli
fi

echo "🚀 Running Speed Test..."
echo "========================"
speedtest --simple