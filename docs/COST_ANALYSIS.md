# Cost Analysis

## AWS EC2 Instance Specification

| Item | Value |
|---|---|
| Instance type | t3.small |
| Operating system | Ubuntu Server / Linux |
| vCPU | 2 |
| Memory | 2 GB RAM |
| Storage | 24 GB gp3 EBS |
| Public IPv4 | 1 |
| Region | us-east-1 / N. Virginia |

## Estimated Monthly Cost

Assuming 24/7 runtime with 730 hours per month:

| Component | Rate | Calculation | Monthly Cost |
|---|---:|---:|---:|
| EC2 compute | $0.0208/hour | 730 hours | $15.184 |
| EBS gp3 | $0.08/GB-month | 24 GB | $1.92 |
| Public IPv4 | $0.005/hour | 730 hours | $3.65 |
| **Total** |  |  | **$20.754/month** |

## Why Cost Planning Matters

This project was built under a student-credit mindset. The objective was not to launch the biggest AI server possible. The objective was to build a useful agent system without silently burning cloud credits.

## Cost Risks

### 1. Running 24/7

Compute cost dominates the bill. Stop the instance when not testing if credits are limited.

### 2. Public IPv4 Billing

Public IPv4 adds a recurring charge even when the instance is small.

### 3. EBS Storage Growth

Local models, logs, caches, and backups can consume storage quickly.

### 4. Cloud Model Usage

Cloud models may have separate rate limits, subscription limits, or token costs depending on provider.

## Practical Optimization

- Keep the instance small.
- Use local Gemma only for narrow repetitive jobs.
- Use cloud models only when quality matters.
- Compress logs.
- Backup only important config and memory folders.
- Do not expose Ollama publicly.
- Periodically check `df -h`, `du -sh ~/.hermes`, and `/var/log`.

## Recommended Monitoring Commands

```bash
free -h
uptime
df -h
systemctl status ollama --no-pager
hermes gateway status
hermes cron list
```

## Project Cost Summary

This project demonstrates that a useful personal AI agent can be built on approximately **$20.754/month** of base AWS infrastructure, excluding optional third-party model usage.
