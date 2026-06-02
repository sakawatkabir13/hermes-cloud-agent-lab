#!/usr/bin/env bash
set -euo pipefail

echo "===== HOST ====="
hostnamectl || true

echo "\n===== UPTIME ====="
uptime

echo "\n===== MEMORY ====="
free -h

echo "\n===== DISK ====="
df -h

echo "\n===== FAILED SYSTEMD SERVICES ====="
systemctl --failed --no-pager || true

echo "\n===== OLLAMA ====="
systemctl is-active ollama || true
curl -s http://127.0.0.1:11434/api/tags | jq . || true

echo "\n===== HERMES GATEWAY ====="
hermes gateway status || true
