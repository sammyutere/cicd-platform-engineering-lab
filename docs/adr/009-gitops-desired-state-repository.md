# ADR-009: Dedicated GitOps Desired-State Repository

**Status:** Accepted

## Context

Application source and deployment desired state have different security, lifecycle and governance requirements.

## Decision

Maintain authorised Kubernetes deployment desired state in a dedicated GitOps repository.

## Consequences

### Positive

- environment changes become visible in Git history;
- production promotion can be reviewed independently;
- Argo CD receives a clearly governed source of truth.

### Negative

- additional repository administration;
- automated promotion requires controlled cross-repository interaction.

## Security Implications

Production desired-state write access shall be treated as production privilege.

