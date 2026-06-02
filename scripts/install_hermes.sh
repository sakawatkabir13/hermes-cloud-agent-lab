#!/usr/bin/env bash
set -euo pipefail

echo "[+] Installing Hermes Agent"
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

echo "[+] Add Hermes to PATH if needed, then run:"
echo "source ~/.bashrc"
echo "hermes doctor"
