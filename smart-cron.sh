#!/bin/bash

echo ""
echo "🕒 Smart Tools Cron Scheduler"
echo "=============================="
echo "Which task do you want to schedule?"
echo "1) 🌐 Auto-run smart-dns"
echo "2) 🧹 Auto-run cleanup-ultra"
echo "3) ❌ Cancel"
read -p "Select [1-3]: " task

if [[ "$task" == "1" || "$task" == "2" ]]; then

  echo ""
  echo "📆 How often should it run?"
  echo "1) Every 15 minutes"
  echo "2) Every hour"
  echo "3) Every 6 hours"
  echo "4) Daily at 3 AM"
  echo "5) Custom (in minutes or hours)"
  read -p "Select frequency [1-5]: " freq

  case "$freq" in
    1) cron_time="*/15 * * * *" ;;
    2) cron_time="0 * * * *" ;;
    3) cron_time="0 */6 * * *" ;;
    4) cron_time="0 3 * * *" ;;
    5)
      echo ""
      read -p "Enter number: " num
      echo "⏱  Is that in (m)inutes or (h)ours?"
      read -p "[m/h]: " unit
      if [[ "$unit" == "m" ]]; then
        cron_time="*/$num * * * *"
      elif [[ "$unit" == "h" ]]; then
        cron_time="0 */$num * * *"
      else
        echo "❌ Invalid unit"
        exit 1
      fi
      ;;
    *)
      echo "❌ Invalid frequency"
      exit 1
      ;;
  esac

  if [[ "$task" == "1" ]]; then
    read -p "Enter domain for smart-dns (e.g. api.kavenegar.com): " domain
    (crontab -l 2>/dev/null; echo "$cron_time /usr/local/bin/smart-dns $domain >> /var/log/smart-dns.log 2>&1") | crontab -
    echo "✅ smart-dns scheduled!"
  else
    (crontab -l 2>/dev/null; echo "$cron_time /usr/local/bin/cleanup-ultra >> /var/log/cleanup.log 2>&1") | crontab -
    echo "✅ cleanup-ultra scheduled!"
  fi

else
  echo "❌ Cancelled."
fi
echo -e "\n\033[1;33m✨ Press any key to return to main menu...\033[0m"
read -n 1 -s