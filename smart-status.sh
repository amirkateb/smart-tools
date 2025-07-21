#!/bin/bash

echo "🧠 System Status Overview"
echo "========================="
echo ""
echo "📊 CPU & Load:"
uptime

echo ""
echo "💾 Memory:"
free -h

echo ""
echo "💽 Disk Usage (root):"
df -h /

echo ""
echo "📦 Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6