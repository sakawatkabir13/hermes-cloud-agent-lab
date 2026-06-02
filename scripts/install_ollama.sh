#!/usr/bin/env bash
set -euo pipefail

echo "[+] Installing Ollama"
curl -fsSL https://ollama.com/install.sh | sh

echo "[+] Checking Ollama service"
systemctl status ollama --no-pager || true

echo "[+] Testing Ollama API"
curl -s http://127.0.0.1:11434/api/tags | jq . || true
