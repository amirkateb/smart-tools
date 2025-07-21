#!/bin/bash

echo "🔑 Checking SSH Keys for All Users"
echo "================================="

for u in $(cut -f1 -d: /etc/passwd); do
  HOME_DIR=$(eval echo ~$u)
  AUTH_KEYS="$HOME_DIR/.ssh/authorized_keys"
  if [ -f "$AUTH_KEYS" ]; then
    echo "✅ $u has SSH keys: $AUTH_KEYS"
  fi
done