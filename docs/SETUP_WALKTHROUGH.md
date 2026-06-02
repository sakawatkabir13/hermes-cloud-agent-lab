# Setup Walkthrough

This document records the build path from scratch.

## 1. Launch EC2 Instance

Configuration:

- AWS EC2
- Ubuntu Server
- t3.small
- 2 vCPU
- 2 GB RAM
- 24 GB gp3 EBS
- Public IPv4
- Region: us-east-1

## 2. SSH Into Server

```bash
ssh -i your-key.pem ubuntu@YOUR_PUBLIC_IP
```

## 3. Bootstrap System

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git nano htop jq ufw python3 python3-pip python3-venv pipx
sudo ufw allow OpenSSH
sudo ufw enable
```

## 4. Install Hermes Agent

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc
hermes doctor
```

## 5. Configure GitHub Copilot Provider

Use your GitHub Copilot token or provider setup flow. Do not commit real tokens.

Example model pool:

- `gpt-5.2-codex`
- `claude-haiku-4.5`
- `gpt-5.4-mini`

## 6. Configure Telegram Gateway

Create a bot using Telegram BotFather.

Project bot name:

```text
Team Death Eaters
```

Create `.env`:

```bash
mkdir -p ~/.hermes
nano ~/.hermes/.env
```

```env
TELEGRAM_BOT_TOKEN=replace_with_token
TELEGRAM_ALLOWED_USERS=replace_with_numeric_telegram_user_id
```

Start gateway:

```bash
hermes gateway install
hermes gateway start
hermes gateway status
```

## 7. Install Ollama

```bash
curl -fsSL https://ollama.com/install.sh | sh
systemctl status ollama --no-pager
```

## 8. Run Ollama Cloud Model

```bash
ollama run minimax-m3:cloud
```

## 9. Download Gemma GGUF

```bash
sudo mkdir -p /opt/models/gemma-4-e2b-it
sudo chown -R "$USER:$USER" /opt/models
cd /opt/models/gemma-4-e2b-it
wget -c -O gemma-4-E2B-it-UD-Q2_K_XL.gguf \
"https://huggingface.co/unsloth/gemma-4-E2B-it-GGUF/resolve/main/gemma-4-E2B-it-UD-Q2_K_XL.gguf?download=true"
```

## 10. Import Gemma Into Ollama

Create Modelfile:

```text
FROM /opt/models/gemma-4-e2b-it/gemma-4-E2B-it-UD-Q2_K_XL.gguf

PARAMETER num_ctx 65536
PARAMETER temperature 0.7
PARAMETER top_p 0.9
```

Create model:

```bash
ollama create gemma4-e2b-q2 -f configs/ollama/Modelfile.gemma4-e2b-q2
ollama run gemma4-e2b-q2
```

## 11. Configure Hermes For Ollama

```yaml
model:
  provider: custom
  default: minimax-m3:cloud
  base_url: http://127.0.0.1:11434/v1
  api_key: ""
  context_length: 65536
```

Alternative local-only profile:

```yaml
model:
  provider: custom
  default: gemma4-e2b-q2
  base_url: http://127.0.0.1:11434/v1
  api_key: ""
  context_length: 65536
```

## 12. Add Cron Jobs

```bash
hermes cron create "every 6h" \
"Check VPS health using uptime, free -h, df -h, and systemctl status ollama. Report only problems." \
--name "VPS Health Check"
```

## 13. Test Full Pipeline

Telegram message:

```text
/status
```

Then:

```text
Check VPS health and tell me whether Ollama and Hermes gateway are running.
```

## Known Limitation

A t3.small has only 2 GB RAM. Gemma 4 E2B Q2 may fail when memory is low or context is too large. This project solves that by using local Gemma for narrow work and cloud models for stronger tasks.
