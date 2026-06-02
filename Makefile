SHELL := /bin/bash

.PHONY: bootstrap install-ollama install-hermes create-gemma health cost backup

bootstrap:
	chmod +x scripts/*.sh
	./scripts/bootstrap_ubuntu.sh

install-ollama:
	./scripts/install_ollama.sh

install-hermes:
	./scripts/install_hermes.sh

create-gemma:
	./scripts/create_gemma_model.sh

health:
	./scripts/health_check.sh

cost:
	./scripts/cost_guard.sh

backup:
	./scripts/backup_hermes.sh
