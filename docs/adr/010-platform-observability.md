# ADR-010: Platform Observability

**Status:** Accepted

## Context

A shared CI/CD platform is an operational service which can itself become unavailable, slow or unreliable.

## Decision

Instrument the delivery platform and measure both:

1. platform operational reliability;
2. software-delivery performance.

Target metrics include:

- pipeline execution count;
- pipeline failures;
- pipeline duration;
- queue time;
- deployment frequency;
- lead time for changes;
- change failure rate;
- restoration time;
- rollback events.

## Consequences

### Positive

- measurable platform reliability;
- evidence-driven optimisation;
- stronger SRE integration.

### Negative

- telemetry implementation requires additional engineering.

## Security Implications

Telemetry shall not expose secrets, credentials or unnecessary sensitive build data.

