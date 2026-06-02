# Hermes Cron Job Examples

## VPS Health

```bash
hermes cron create "every 6h" \
"Check VPS health using uptime, free -h, df -h, systemctl --failed, and systemctl status ollama. Report only risks." \
--name "VPS Health Check"
```

## Morning Briefing

```bash
hermes cron create "every day at 8am" \
"Send a morning briefing with VPS health, one development task, one CSE study target, and one personal priority." \
--name "Morning Briefing"
```

## Night Review

```bash
hermes cron create "every day at 11pm" \
"Ask me what I completed today. Help me identify one bottleneck and tomorrow's first task." \
--name "Night Review"
```

## Weekly Cost Guard

```bash
hermes cron create "every Monday at 10am" \
"Remind me to check AWS billing, public IPv4 charge, EBS volume size, snapshots, and whether the EC2 instance should stay running." \
--name "Weekly Cost Guard"
```

## Ollama Watchdog

```bash
hermes cron create "every 4h" \
"Check whether Ollama is active and whether http://127.0.0.1:11434/api/tags responds. Report problems only." \
--name "Ollama Watchdog"
```

## Study Drill

```bash
hermes cron create "every day at 7pm" \
"Give me one practical CSE engineering drill: DSA, Linux, Git, SQL, API design, debugging, or networking." \
--name "Daily Engineering Drill"
```
