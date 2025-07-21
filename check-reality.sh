#!/bin/bash

INPUT_FILE="/usr/local/bin/domains.txt"
MAX_PARALLEL=10

echo "🔍 Starting domain check for TLS 1.3 and HTTP access with latency measurement..."

best_domain=""
best_latency=9999
result_file=$(mktemp)

check_domain() {
    DOMAIN=$1
    TLS=$(echo | timeout 5 openssl s_client -connect "$DOMAIN:443" -tls1_3 2>/dev/null)

    if [[ "$TLS" == *"Cipher is"* ]]; then
        RESULT=$(curl -s -o /dev/null -w "%{http_code} %{time_connect} %{time_starttransfer}" "https://$DOMAIN")
        HTTP_CODE=$(echo $RESULT | cut -d' ' -f1)
        TIME_CONNECT=$(echo $RESULT | cut -d' ' -f2)

        if [[ "$HTTP_CODE" == "200" || "$HTTP_CODE" == "301" || "$HTTP_CODE" == "302" ]]; then
            echo "🌐 $DOMAIN ✅ | Connect: ${TIME_CONNECT}s"
            TIME_MS=$(echo "$TIME_CONNECT * 1000" | bc | cut -d'.' -f1)
            echo "$TIME_MS $DOMAIN" >> "$result_file"
        else
            echo "🌐 $DOMAIN ⚠️ HTTP failed (code $HTTP_CODE)"
        fi
    else
        echo "🌐 $DOMAIN ❌ No TLS 1.3 support"
    fi
}

export -f check_domain
export result_file

cat "$INPUT_FILE" | grep -v '^#' | grep -v '^\s*$' | xargs -P $MAX_PARALLEL -n 1 -I {} bash -c 'check_domain "$0"' {}

if [[ -s "$result_file" ]]; then
    best=$(sort -n "$result_file" | head -n 1)
    best_latency=$(echo $best | cut -d' ' -f1)
    best_domain=$(echo $best | cut -d' ' -f2)
    echo ""
    echo "🏆 Best domain for Reality:"
    echo "➡️  $best_domain  (connect time: ${best_latency} ms)"
else
    echo "⚠️ No suitable domain found."
fi

rm "$result_file"
