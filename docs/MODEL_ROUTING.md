# Model Routing Strategy

## Why Model Routing Matters

Using one model for every task is inefficient.

A small local model is cheap but weak. A strong cloud model is better but should be reserved for tasks where quality matters.

## Model Inventory

| Model | Access Layer | Best Use |
|---|---|---|
| `gemma4-e2b-q2` | Ollama local GGUF | Repetitive jobs, health checks, small summaries |
| `minimax-m3:cloud` | Ollama Cloud | General reasoning, larger assistant tasks |
| `gpt-5.2-codex` | GitHub Copilot | Coding, repo refactors, debugging, tests |
| `claude-haiku-4.5` | GitHub Copilot | Fast summaries, triage, lightweight reasoning |
| `gpt-5.4-mini` | GitHub Copilot | Balanced fast reasoning and planning |

## Routing Rules

### Use Local Gemma For

- VPS health checks
- Reminder generation
- Simple text cleanup
- Log summarization under strict instructions
- Small daily briefings
- Cron output formatting

### Use minimax-m3:cloud For

- General conversation
- Better reasoning
- Multi-step planning
- Architecture explanations
- Workflow design

### Use GPT-5.2 Codex For

- Code review
- Debugging
- Unit tests
- Refactoring
- Project scaffolding
- CI/CD setup

### Use Claude Haiku / GPT Mini For

- Fast explanations
- Summaries
- Decision notes
- Classification
- Quick documentation drafts

## Security Task Routing

For security/pentesting tasks:

- Use local Gemma only for note formatting and checklist reminders.
- Use stronger cloud models for defensive analysis.
- Keep scope restricted to owned systems and labs.
- Never automate unauthorized scanning or exploitation.

## Suggested Hermes Profiles

### Local Repetitive Job Profile

```yaml
model:
  provider: custom
  default: gemma4-e2b-q2
  base_url: http://127.0.0.1:11434/v1
  api_key: ""
  context_length: 65536
```

### Ollama Cloud Profile

```yaml
model:
  provider: custom
  default: minimax-m3:cloud
  base_url: http://127.0.0.1:11434/v1
  api_key: ""
  context_length: 65536
```

## Practical Rule

Use the weakest model that can safely complete the task.

But for code, infrastructure, and security decisions, do not underpower the model. A cheap wrong answer is expensive.
