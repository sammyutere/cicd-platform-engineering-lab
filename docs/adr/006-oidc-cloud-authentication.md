# ADR-006: OIDC Cloud Authentication

**Status:** Accepted

## Context

Long-lived cloud access keys stored in CI systems increase credential exposure and rotation burden.

## Decision

Use GitHub Actions OIDC federation and short-lived cloud credentials wherever supported.

Persistent AWS access keys shall not be the normal platform authentication mechanism.

## Consequences

### Positive

- eliminates routine long-lived CI cloud credentials;
- short-lived sessions;
- stronger identity-policy binding.

### Negative

- cloud trust policies require careful configuration;
- OIDC claims become part of the security contract.

## Security Implications

OIDC audience, subject and trust-policy conditions must be constrained to approved identities and workflows.

