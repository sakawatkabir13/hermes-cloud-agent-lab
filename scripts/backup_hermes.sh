#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="$HOME/backups/hermes"
STAMP="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

ARCHIVE="$BACKUP_DIR/hermes-backup-$STAMP.tar.gz"

echo "[+] Creating backup: $ARCHIVE"
tar --exclude='.env' \
    --exclude='*.db-wal' \
    --exclude='*.db-shm' \
    -czf "$ARCHIVE" \
    "$HOME/.hermes" 2>/dev/null || true

echo "[+] Done"
ls -lh "$ARCHIVE"
