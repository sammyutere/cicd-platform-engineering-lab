# ADR-008: Immutable GitHub Action References

**Status:** Accepted

## Context

Mutable Git tags may resolve to different source code over time.

Trusted CI infrastructure should know exactly which dependency revision executes.

## Decision

Third-party GitHub Actions used in trusted platform workflows shall ultimately be pinned to full immutable commit SHAs.

Human-readable release versions should be retained in comments where useful.

## Consequences

### Positive

- deterministic dependency execution;
- explicit dependency upgrades;
- stronger reviewability.

### Negative

- dependency updates require intentional maintenance.

## Security Implications

This reduces reliance on mutable upstream references within the trusted CI supply chain.

