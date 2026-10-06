#!/usr/bin/env bash

set -euo pipefail

PASS_COUNT=0
FAIL_COUNT=0

pass() {
  printf 'PASS: %s\n' "$1"
  PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
  printf 'FAIL: %s\n' "$1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

require_file() {
  if [[ -f "$1" ]]; then
    pass "file exists: $1"
  else
    fail "missing file: $1"
  fi
}

require_text() {
  local file="$1"
  local pattern="$2"
  local description="$3"

  if grep -Eq "$pattern" "$file"; then
    pass "$description"
  else
    fail "$description"
  fi
}

echo "========================================"
echo " Milestone 1 Acceptance Validation"
echo "========================================"
echo

require_file "README.md"
require_file "CONTRIBUTING.md"
require_file ".gitignore"
require_file ".editorconfig"
require_file ".github/CODEOWNERS"
require_file ".github/pull_request_template.md"

require_file "docs/contracts/engineering-contract.md"
require_file "docs/contracts/functional-requirements.md"
require_file "docs/contracts/non-functional-requirements.md"

require_file "docs/architecture/architecture.md"
require_file "docs/architecture/trust-boundaries.md"
require_file "docs/architecture/repository-model.md"

for adr in docs/adr/[0-9][0-9][0-9]-*.md; do
  require_file "$adr"
done

ADR_COUNT="$(find docs/adr -maxdepth 1 -name '[0-9][0-9][0-9]-*.md' | wc -l | tr -d ' ')"

if [[ "$ADR_COUNT" == "10" ]]; then
  pass "exactly 10 initial ADRs exist"
else
  fail "expected 10 ADRs, found $ADR_COUNT"
fi

require_text \
  "docs/contracts/engineering-contract.md" \
  "Build once, promote many" \
  "build-once/promote-many contract exists"

require_text \
  "docs/contracts/engineering-contract.md" \
  "CI and CD SHALL remain separated" \
  "CI/CD separation contract exists"

require_text \
  "docs/contracts/engineering-contract.md" \
  "Long-lived cloud credentials" \
  "long-lived credential restriction exists"

require_text \
  "docs/contracts/engineering-contract.md" \
  "Reusable workflows are platform APIs" \
  "pipeline-as-platform-API contract exists"

require_text \
  "docs/architecture/architecture.md" \
  "Argo CD" \
  "Argo CD reconciliation architecture exists"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  pass "repository is a Git work tree"
else
  fail "repository is not a Git work tree"
fi

CURRENT_BRANCH="$(git branch --show-current)"

if [[ "$CURRENT_BRANCH" == "main" ]]; then
  pass "current branch is main"
else
  fail "current branch is '$CURRENT_BRANCH', expected main"
fi

echo
echo "========================================"
printf 'Passed: %s\n' "$PASS_COUNT"
printf 'Failed: %s\n' "$FAIL_COUNT"
echo "========================================"

if [[ "$FAIL_COUNT" -ne 0 ]]; then
  echo "Milestone 1 structural validation: FAIL"
  exit 1
fi

echo "Milestone 1 structural validation: PASS"
