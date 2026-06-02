# Workflow Catalog

This project is designed for daily repetitive workflows.

## 1. VPS Health Check

```bash
hermes cron create "every 6h" \
"Check VPS health using uptime, free -h, df -h, and systemctl status ollama. Report only abnormal results." \
--name "VPS Health Check"
```

## 2. Ollama Watchdog

```bash
hermes cron create "every 4h" \
"Check whether Ollama is running. Test http://127.0.0.1:11434/api/tags. If Ollama is down, report exact restart command." \
--name "Ollama Watchdog"
```

## 3. Daily Morning Briefing

```bash
hermes cron create "every day at 8am" \
"Send me a morning briefing: VPS status, one development task, one CSE study task, and one priority for today." \
--name "Morning Briefing"
```

## 4. Night Review

```bash
hermes cron create "every day at 11pm" \
"Ask me what I completed today. Then help me identify one bottleneck and tomorrow's first task." \
--name "Night Review"
```

## 5. Development Sprint Assistant

Telegram prompt:

```text
Review my current repo status. Tell me the next 3 engineering tasks that would improve maintainability.
```

## 6. CSE Study Drill

```bash
hermes cron create "every day at 7pm" \
"Give me one practical engineering drill: DSA, Linux, Git, database, API design, or debugging. Keep it under 10 lines." \
--name "Engineering Drill"
```

## 7. Weekly Project Review

```bash
hermes cron create "every Sunday at 9pm" \
"Review this week's study and project progress. Ask for missing data if needed, then suggest next week's plan." \
--name "Weekly Review"
```

## 8. Backup Reminder

```bash
hermes cron create "every day at 2am" \
"Check whether Hermes config and project files are backed up. Report if backup is missing or older than 24 hours." \
--name "Backup Check"
```

## 9. Security Lab Notes

Telegram prompt:

```text
Summarize my authorized lab findings into: scope, evidence, risk, remediation, and next action. Do not create exploit steps.
```

## 10. Cost Guard

```bash
hermes cron create "every Monday at 10am" \
"Remind me to check AWS billing, EBS size, public IPv4 charge, and whether this EC2 instance should stay running." \
--name "Weekly Cost Guard"
```

## Workflow Design Rule

A good repetitive job prompt should specify:

1. Exact data sources
2. Exact output format
3. When to alert
4. What not to do
5. Whether the task may modify the system

Bad prompt:

```text
Check server.
```

Good prompt:

```text
Check uptime, RAM, disk, failed services, and Ollama status. Do not change anything. Alert only if RAM free is below 300 MB, disk usage is over 85%, or Ollama is down.
```
