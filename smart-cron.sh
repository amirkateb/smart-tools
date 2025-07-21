#!/bin/bash

echo ""
echo "🕒 Smart Tools Cron Scheduler"
echo "=============================="
echo "Which task do you want to schedule?"
echo "1) 🌐 Auto-run smart-dns (DNS Optimizer)"
echo "2) 🧹 Auto-run cleanup-ultra (System Cleanup)"
echo "3) ❌ Cancel"
read -p "Enter option [1-3]: " task

if [[ "$task" == "1" ]]; then
  read -p "Enter domain for DNS test (e.g. api.kavenegar.com): " domain
  read -p "Enter cron time (e.g. '0 */6 * * *' for every 6h): " cron_time
  (crontab -l 2>/dev/null; echo "$cron_time /usr/local/bin/smart-dns $domain >> /var/log/smart-dns.log 2>&1") | crontab -
  echo "✅ smart-dns scheduled successfully!"
elif [[ "$task" == "2" ]]; then
  read -p "Enter cron time (e.g. '0 3 * * 0' for every Sunday 3AM): " cron_time
  (crontab -l 2>/dev/null; echo "$cron_time /usr/local/bin/cleanup-ultra >> /var/log/cleanup.log 2>&1") | crontab -
  echo "✅ cleanup-ultra scheduled successfully!"
else
  echo "❌ Cancelled"
fi