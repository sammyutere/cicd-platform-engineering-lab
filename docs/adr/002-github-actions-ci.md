# ADR-002: GitHub Actions as CI Orchestrator

**Status:** Accepted

## Context

The platform requires CI orchestration integrated with repository events, reusable automation, repository governance and workload identity federation.

## Decision

Use GitHub Actions as the primary CI orchestration platform.

## Consequences

### Positive

- close integration with source repositories;
- reusable workflow support;
- integrated repository permissions;
- OIDC support;
- suitable portfolio visibility.

### Negative

- GitHub Actions security becomes part of the platform security model;
- workflow implementation is coupled to GitHub-specific interfaces.

## Alternatives Considered

- Jenkins;
- GitLab CI;
- Tekton;
- other managed CI platforms.

They remain valid technologies but are outside the primary implementation path for this lab.

## Security Implications

Workflow permissions, third-party Actions, secrets, runner trust and OIDC policy require explicit controls.

