#!/bin/bash

echo "🛡️  Running Basic Security Check"
echo "==============================="

echo ""
echo "🔒 Checking SSH root login:"
grep "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null || echo "  🔸 Not set → should be 'no'"

echo ""
echo "🔐 Checking sudo access without password:"
grep NOPASSWD /etc/sudoers /etc/sudoers.d/* 2>/dev/null || echo "  ✅ No unrestricted sudo access found"

echo ""
echo "🛡️  Open ports (should be minimal):"
sudo ss -tuln | grep LISTEN

echo ""
echo "📂 World-writable files (security risk):"
find / -xdev -type f -perm -0002 -ls 2>/dev/null | head -n 5 || echo "  ✅ No world-writable files found"

echo ""
echo "⚠️  Setuid binaries (can be abused):"
find / -perm -4000 -type f 2>/dev/null | head -n 5

echo ""
echo "✅ Security scan complete. Manually review findings for hardening."
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s