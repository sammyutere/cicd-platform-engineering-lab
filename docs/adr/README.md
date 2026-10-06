# Architecture Decision Records

Architecture Decision Records capture significant technical decisions affecting the CI/CD platform.

## ADR States

- Proposed
- Accepted
- Superseded
- Rejected

## Governance Rule

Accepted ADRs are historical engineering records.

An accepted ADR must not be silently rewritten simply because the architecture later changes.

Instead:

1. create a new ADR;
2. explain the new decision;
3. reference the previous ADR;
4. mark the previous decision as superseded when appropriate.

## Initial Decisions

- ADR-001 — Multi-Repository Architecture
- ADR-002 — GitHub Actions as CI Orchestrator
- ADR-003 — Reusable Workflows as Platform APIs
- ADR-004 — GitOps Separation of CI and CD
- ADR-005 — Immutable Artifact Promotion
- ADR-006 — OIDC Cloud Authentication
- ADR-007 — Signed Software Supply Chain
- ADR-008 — Immutable GitHub Action References
- ADR-009 — Dedicated GitOps Desired-State Repository
- ADR-010 — Platform Observability
