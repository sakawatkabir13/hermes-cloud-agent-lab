#!/usr/bin/env bash
set -euo pipefail

echo "[+] Updating system"
sudo apt update
sudo apt upgrade -y

echo "[+] Installing base packages"
sudo apt install -y \
  curl wget git nano htop jq ufw unzip \
  python3 python3-pip python3-venv pipx ca-certificates gnupg

echo "[+] Configuring firewall"
sudo ufw allow OpenSSH || true
sudo ufw --force enable

echo "[+] Creating model directory"
sudo mkdir -p /opt/models/gemma-4-e2b-it
sudo chown -R "$USER:$USER" /opt/models

echo "[+] Done"
