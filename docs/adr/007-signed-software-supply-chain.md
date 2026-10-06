# ADR-007: Signed Software Supply Chain

**Status:** Accepted

## Context

Presence of a container image in a registry does not prove that it originated from an authorised build or that its integrity should be trusted.

## Decision

The delivery platform shall progressively introduce:

- vulnerability scanning;
- SBOM generation;
- build provenance;
- artefact signing;
- signature verification.

## Consequences

### Positive

- stronger artefact identity;
- auditable supply-chain evidence;
- policy-enforceable release trust.

### Negative

- additional tooling and policy complexity;
- signing and verification identities must be managed carefully.

## Security Implications

Production admission must eventually verify trusted release identity rather than trusting registry location alone.

