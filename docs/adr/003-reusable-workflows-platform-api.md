# ADR-003: Reusable Workflows as Platform APIs

**Status:** Accepted

## Context

Duplicating CI logic across application repositories creates drift, inconsistent security and high maintenance cost.

## Decision

Implement shared CI capabilities using centrally maintained reusable workflows.

Treat workflow inputs, outputs, permissions and observable behaviour as versioned platform APIs.

## Consequences

### Positive

- reduced duplication;
- consistent security controls;
- simpler application repositories;
- centrally governed delivery behaviour.

### Negative

- compatibility must be managed;
- platform changes may have broad consumer impact.

## Alternatives Considered

Independent full CI pipelines within every application repository.

Rejected because it undermines central platform governance.

## Security Implications

Reusable workflows become trusted supply-chain infrastructure and therefore require strong review and dependency controls.

