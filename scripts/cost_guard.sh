#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
Cost Guard Checklist
====================

Manual AWS Console checks:
- EC2 instance is still needed.
- Instance type is still t3.small.
- EBS volume is still 24 GB.
- No unused Elastic IPs.
- No unexpected snapshots.
- No NAT Gateway or Load Balancer accidentally created.
- Billing dashboard is within student-credit budget.

Local checks:
EOF

printf "\nDisk usage:\n"
df -h

printf "\nLargest /opt directories:\n"
sudo du -h --max-depth=1 /opt 2>/dev/null | sort -h || true

printf "\nHermes/Ollama size:\n"
du -sh ~/.hermes ~/.ollama 2>/dev/null || true
