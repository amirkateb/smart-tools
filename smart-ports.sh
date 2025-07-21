#!/bin/bash

echo "🔓 Open Listening Ports"
echo "========================"
sudo ss -tulnp | grep LISTEN || sudo netstat -tulnp | grep LISTEN