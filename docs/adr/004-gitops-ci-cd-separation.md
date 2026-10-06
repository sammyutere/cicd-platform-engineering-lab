# ADR-004: GitOps Separation of CI and CD

**Status:** Accepted

## Context

Allowing ordinary CI workflows direct production-cluster access combines build and deployment privilege.

A CI compromise could therefore become a production-cluster compromise.

## Decision

CI shall:

- test;
- build;
- inspect;
- sign;
- publish.

Deployment shall occur through declarative GitOps desired state reconciled by Argo CD.

Ordinary CI workflows shall not directly deploy production workloads using kubectl or equivalent imperative mechanisms.

## Consequences

### Positive

- stronger separation of duties;
- auditable deployment state;
- clearer rollback history;
- reduced CI privilege.

### Negative

- additional GitOps repository and reconciliation components;
- eventual consistency replaces direct imperative deployment.

## Security Implications

Write access to production GitOps state becomes security-sensitive and must be governed accordingly.

