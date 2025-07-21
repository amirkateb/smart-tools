# 🧠 Smart Server Tools

A powerful collection of Bash-based tools for system maintenance, diagnostics, security, and network analysis — designed for Linux servers.

مجموعه‌ای قدرتمند از ابزارهای Bash برای نگهداری سیستم، عیب‌یابی، امنیت و تحلیل شبکه — مخصوص سرورهای لینوکس.

Developed by **AmirMohammad Kateb Saber**

---

## 📦 Installation | نصب

To install Smart Server Tools:

برای نصب ابزارها دستور زیر را اجرا کنید:

```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/smart-tools/main/install.sh | bash
```

After installation, run the toolkit with:

پس از نصب، برای اجرای ابزار از دستور زیر استفاده کنید:

```bash
smart-tools
```

---

## 📋 Available Tools | ابزارهای موجود

| Tool Name                | Description (English)                                          | توضیح (فارسی)                                       |
|--------------------------|---------------------------------------------------------------|-----------------------------------------------------|
| `cleanup-ultra`          | Clean logs, temp, apt cache, and unused files                 | پاک‌سازی عمیق سیستم از فایل‌های اضافی و موقتی       |
| `smart-dns`              | Find & set the fastest DNS for a given domain                 | یافتن سریع‌ترین DNS برای یک دامنه خاص              |
| `check-reality`          | Identify the best domains for Reality/Xray/V2Ray             | شناسایی دامنه‌های مناسب برای Reality یا Xray        |
| `smart-cron`             | Schedule auto cleanup or DNS change                          | زمان‌بندی خودکار برای اجرای ابزارها                 |
| `smart-status`           | Overview of CPU, RAM, disk, and system load                  | نمایش خلاصه‌ای از وضعیت منابع سیستم                |
| `smart-net`              | Show current IP, DNS, connectivity, and traceroute           | نمایش IP، DNS، اتصال و مسیر شبکه                    |
| `smart-ping`             | Ping local (Iran) and international websites                 | بررسی تأخیر ارتباطی با سایت‌های داخلی و خارجی      |
| `smart-ports`            | List open ports and running services                         | نمایش پورت‌های باز و سرویس‌های مرتبط               |
| `smart-updater`          | Update Linux packages and Smart Tools itself                 | به‌روزرسانی سیستم‌عامل و ابزارهای نصب‌شده          |
| `smart-traffic`          | Monitor live network traffic (requires vnstat)               | مشاهده ترافیک زنده شبکه                            |
| `smart-speed`            | Install & run an internet speed test                         | اجرای تست سرعت اینترنت با نصب خودکار ابزار لازم    |
| `smart-fail2ban`         | Show Fail2Ban status and blocked IPs                         | نمایش وضعیت و لیست IPهای بلاک شده در Fail2Ban      |
| `smart-secure`           | Security audit for the server                                | بررسی امنیتی سرور و نمایش مشکلات احتمالی          |
| `smart-sshkey-check`     | Show SSH keys configured per user                            | بررسی کلیدهای SSH کاربران سیستم                    |
| `smart-packages`         | Show installed, outdated, or large packages                  | لیست پکیج‌های بزرگ، قدیمی یا بی‌استفاده             |
| `smart-clock`            | Change timezone (Iran, USA, Germany, or custom)              | تغییر منطقه زمانی سیستم                            |
| `smart-users`            | List system users and basic info                             | نمایش لیست کاربران و وضعیت دسترسی آن‌ها            |
| `smart-ssh-harden`       | Secure SSH config: disable root login, change port, etc.     | امن‌سازی SSH: تغییر پورت، غیرفعال‌کردن روت و...    |
| `smart-ip-checkhost`     | Test your server IP with multiple global locations           | بررسی IP سرور از چند کشور با سرویس CheckHost       |

---

## 🧰 Interactive Menu | منوی تعاملی ابزارها

Run `smart-tools` to open the full-featured CLI menu:

برای اجرای منوی کامل ابزار از دستور زیر استفاده کنید:

```bash
smart-tools
```

Main sections include:

- 🧹 System Maintenance
- 🌐 Network Tools
- 🔒 Security & Access
- 📦 Packages & Services
- ⚙️  Settings
- ❌ Exit

---

## 🧼 Uninstall | حذف ابزار

To uninstall Smart Server Tools completely:

برای حذف کامل ابزارها:

```bash
sudo /usr/local/bin/smart-uninstall
```

---

## 📄 License

Smart Server Tools is open-source and available under the MIT License.

---

## ✨ Credits

Project created and maintained by **AmirMohammad Kateb Saber**