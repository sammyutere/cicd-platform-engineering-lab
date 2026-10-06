# ADR-001: Multi-Repository Architecture

**Status:** Accepted

## Context

Application source, shared CI/CD platform implementation and production desired state have different ownership, security and lifecycle characteristics.

Combining all three concerns would weaken trust boundaries and make it easier for ordinary application changes to affect platform or production control paths.

## Decision

Use separate repositories for:

1. shared CI/CD platform capabilities;
2. reference application source;
3. GitOps desired deployment state.

## Consequences

### Positive

- clearer ownership;
- stronger trust boundaries;
- independent lifecycle management;
- realistic platform-consumer relationship;
- reusable platform interfaces.

### Negative

- additional repository administration;
- cross-repository permissions must be deliberately engineered;
- version compatibility must be managed.

## Alternatives Considered

A single monorepository containing application source, CI implementation and deployment desired state.

Rejected for this lab because it weakens the platform abstraction and security model.

## Security Implications

Cross-repository access shall follow least privilege.

