# Security and Ethics

## Purpose

This project can support security-learning and defensive workflows, but it must stay within authorized boundaries.

## Allowed Security Uses

- Personal lab documentation
- Owned VPS hardening
- Log review
- CVE summarization
- Defensive remediation planning
- Report formatting
- Checklist generation
- Security study planning
- Authorized pentest note organization

## Disallowed Uses

This project should not be used for:

- Unauthorized scanning
- Credential theft
- Malware creation
- Persistence/evasion
- Phishing
- Exploit automation against third-party systems
- Bypassing access controls
- Attacking real targets without permission

## Operational Boundaries

### 1. No Secrets in Git

Never commit:

- Telegram bot token
- GitHub Copilot token
- API keys
- SSH private keys
- AWS credentials
- `.env` files
- Hermes memory database

### 2. Keep Ollama Private

Ollama should bind locally only unless explicitly protected behind strong authentication and network controls.

Recommended:

```text
127.0.0.1:11434
```

Do not expose `11434` publicly.

### 3. Telegram Allowlist

Use numeric Telegram IDs:

```env
TELEGRAM_ALLOWED_USERS=123456789
```

### 4. Least-Privilege Automation

For cron jobs, prefer read-only checks first.

Good:

```text
Check disk usage and report if over 85%. Do not delete anything.
```

Risky:

```text
Clean my server automatically.
```

### 5. Human Review For Code/Security Changes

Do not allow a weak local model to make unsupervised security or infrastructure changes.

## Security Posture

This project is designed as a personal productivity and defensive operations assistant, not an offensive autonomous agent.
