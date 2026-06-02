#!/usr/bin/env bash
set -euo pipefail

MODEL_FILE="/opt/models/gemma-4-e2b-it/gemma-4-E2B-it-UD-Q2_K_XL.gguf"
MODEL_NAME="gemma4-e2b-q2"
MODELFILE_PATH="configs/ollama/Modelfile.gemma4-e2b-q2"

if [[ ! -f "$MODEL_FILE" ]]; then
  echo "[!] Missing model file: $MODEL_FILE"
  echo "Download it first:"
  echo "cd /opt/models/gemma-4-e2b-it"
  echo "wget -c -O gemma-4-E2B-it-UD-Q2_K_XL.gguf 'https://huggingface.co/unsloth/gemma-4-E2B-it-GGUF/resolve/main/gemma-4-E2B-it-UD-Q2_K_XL.gguf?download=true'"
  exit 1
fi

echo "[+] Fixing permissions"
sudo chmod 755 /opt /opt/models /opt/models/gemma-4-e2b-it
sudo chmod 644 "$MODEL_FILE"

echo "[+] Creating Ollama model: $MODEL_NAME"
ollama rm "$MODEL_NAME" 2>/dev/null || true
ollama create "$MODEL_NAME" -f "$MODELFILE_PATH"

echo "[+] Testing model list"
ollama list
