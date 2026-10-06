.PHONY: help structure validate secrets-check status

help:
	@echo "Targets:"
	@echo "  make structure      Display repository files"
	@echo "  make validate       Validate Milestone 1 architecture baseline"
	@echo "  make secrets-check  Search for common accidental credential patterns"
	@echo "  make status         Show repository status"

structure:
	@find . -type f -not -path "./.git/*" | sort

validate:
	@./platform/scripts/validate-milestone-01.sh

secrets-check:
	@echo "Scanning repository for common credential patterns..."
	@! grep -RniE 'AWS_ACCESS_KEY_ID[[:space:]]*=|AWS_SECRET_ACCESS_KEY[[:space:]]*=|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|password[[:space:]]*=|token[[:space:]]*=' . --exclude-dir=.git --exclude=Makefile --exclude='*.md' || (echo "Potential credential material detected"; exit 1)
	@echo "Basic credential-pattern scan: PASS"

status:
	@git status --short
