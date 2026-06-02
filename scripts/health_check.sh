#!/usr/bin/env bash
set -euo pipefail

echo "===== HOST ====="
hostnamectl || true

printf "\n===== UPTIME =====\n"
uptime

printf "\n===== MEMORY =====\n"
free -h

printf "\n===== DISK =====\n"
df -h

printf "\n===== FAILED SYSTEMD SERVICES =====\n"
systemctl --failed --no-pager || true

printf "\n===== OLLAMA =====\n"
systemctl is-active ollama || true
curl -s http://127.0.0.1:11434/api/tags | jq . || true

printf "\n===== HERMES GATEWAY =====\n"
hermes gateway status || true
