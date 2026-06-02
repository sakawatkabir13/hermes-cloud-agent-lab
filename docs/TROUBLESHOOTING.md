# Troubleshooting

## Ollama: model requires more system memory

Example:

```text
model requires more system memory (2.6 GiB) than is available (1.2 GiB)
```

Cause:

- VPS does not have enough available RAM.
- Context length is too high.
- Other services are consuming memory.

Fix options:

```bash
free -h
sudo systemctl restart ollama
```

Add swap if needed:

```bash
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Reduce context in Modelfile:

```text
PARAMETER num_ctx 2048
```

Recreate model:

```bash
ollama rm gemma4-e2b-q2
ollama create gemma4-e2b-q2 -f configs/ollama/Modelfile.gemma4-e2b-q2
```

## Hugging Face download killed

Cause:

- HF CLI consumed too much memory on tiny VPS.

Use `wget` instead:

```bash
wget -c -O gemma-4-E2B-it-UD-Q2_K_XL.gguf \
"https://huggingface.co/unsloth/gemma-4-E2B-it-GGUF/resolve/main/gemma-4-E2B-it-UD-Q2_K_XL.gguf?download=true"
```

## Hermes gateway not responding

Check:

```bash
hermes gateway status
journalctl --user -u hermes-gateway -f
```

Restart:

```bash
hermes gateway restart
```

Enable lingering if needed:

```bash
sudo loginctl enable-linger "$USER"
```

## Telegram bot does not reply

Check:

- Bot token is correct.
- Telegram user ID is numeric.
- User ID is in `TELEGRAM_ALLOWED_USERS`.
- Gateway is running.

## Ollama endpoint test

```bash
curl http://127.0.0.1:11434/api/tags
curl http://127.0.0.1:11434/v1/models
```

## Disk full

Check:

```bash
df -h
sudo du -h --max-depth=1 /opt | sort -h
du -sh ~/.hermes ~/.ollama 2>/dev/null
```

## Useful Logs

```bash
journalctl -u ollama -f
journalctl --user -u hermes-gateway -f
```
