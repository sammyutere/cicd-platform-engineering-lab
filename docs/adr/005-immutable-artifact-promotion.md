# ADR-005: Immutable Artifact Promotion

**Status:** Accepted

## Context

Building separate artefacts for development, staging and production means production may run software different from what was tested previously.

## Decision

Build releasable artefacts once.

Promote the same immutable content digest through:

Development → Staging → Production

## Consequences

### Positive

- stronger release confidence;
- improved traceability;
- simpler provenance;
- deterministic promotion.

### Negative

- runtime configuration must be cleanly separated from application artefacts.

## Security Implications

Digest identity and integrity must be preserved throughout the promotion chain.

