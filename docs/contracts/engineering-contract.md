# CI/CD Platform Engineering Contract

**Status:** ACTIVE  
**Milestone:** 1 — CI/CD Platform Architecture & Engineering Contract

This document defines the architectural rules governing the CI/CD Platform Engineering Lab.

These rules are deliberately established before implementation. Later milestones may extend the platform, but they must not silently violate these principles.

---

## 1. CI and CD SHALL remain separated

Continuous Integration is responsible for:

- validation;
- linting;
- testing;
- building;
- security analysis;
- SBOM generation;
- provenance generation;
- artefact signing;
- artefact publication.

Continuous Delivery is responsible for changing authorised desired deployment state.

CI SHALL NOT directly deploy production workloads through:

- `kubectl apply`;
- imperative Helm deployment;
- direct production-cluster credentials;
- equivalent mechanisms that bypass GitOps reconciliation.

Argo CD SHALL ultimately reconcile approved desired state into Kubernetes.

---

## 2. Build once, promote many

A releasable artefact SHALL be built once.

The identical immutable artefact SHALL move through:

Development → Staging → Production

Environment-specific rebuilds are prohibited.

Container image digests, rather than mutable tags alone, SHALL identify promoted release artefacts.

---

## 3. Reusable workflows are platform APIs

Common CI/CD capabilities SHALL be maintained centrally.

Application repositories SHALL consume reusable platform workflows rather than duplicate platform implementation.

Reusable workflow:

- inputs;
- outputs;
- permissions;
- expected behaviour;
- failure semantics

constitute a versioned platform interface.

Breaking interface changes SHALL require deliberate version evolution.

---

## 4. Least privilege is mandatory

Workflow permissions SHALL be explicitly declared.

Jobs SHALL receive only the permissions required to perform their responsibilities.

Privileged credentials SHALL NOT be exposed to untrusted pull-request execution.

---

## 5. Long-lived cloud credentials are prohibited as the normal model

The platform SHALL prefer workload identity federation.

GitHub Actions SHALL authenticate to AWS using OIDC and short-lived credentials where applicable.

Persistent AWS access keys SHALL NOT be the default CI/CD authentication mechanism.

---

## 6. Software supply-chain evidence is required

Trusted release artefacts SHALL progressively acquire:

- automated test evidence;
- vulnerability scan results;
- software bill of materials;
- build provenance;
- cryptographic signature;
- verifiable identity.

Production admission SHALL eventually verify required supply-chain evidence.

---

## 7. External Actions SHALL be treated as dependencies

Third-party GitHub Actions used by trusted workflows SHALL be reviewed as software dependencies.

Trusted platform workflows SHALL ultimately pin third-party Actions to immutable full commit SHAs.

Dependency upgrades SHALL be explicit and reviewable.

---

## 8. Git SHALL represent authorised desired state

Deployment state SHALL be declarative.

A dedicated GitOps repository SHALL ultimately represent authorised environment state.

Argo CD SHALL reconcile Git desired state with Kubernetes runtime state.

---

## 9. Production promotion SHALL promote verified artefacts

Production deployment SHALL use an artefact previously exercised in lower environments.

Production SHALL NOT cause source to be independently rebuilt.

---

## 10. Policy SHALL be automated where practical

Security, deployment and admission requirements SHOULD be expressed as automated policy rather than human convention alone.

Policy SHALL fail safely.

---

## 11. The delivery platform SHALL be observable

The CI/CD platform is an operational service.

The platform SHALL progressively expose:

- pipeline execution count;
- pipeline failure rate;
- pipeline duration;
- queue time;
- deployment count;
- failed deployment count;
- rollback count;
- deployment frequency;
- lead time for changes;
- change failure rate;
- restoration time.

---

## 12. Developer cognitive load SHALL decrease

The platform exists to provide supported delivery capabilities to application teams.

Application engineers SHOULD NOT need deep knowledge of:

- CI implementation internals;
- registry authentication;
- SBOM tooling;
- signing implementation;
- GitOps internals;
- Kubernetes admission-policy internals

to deploy a conventional supported workload.

A Golden Path SHALL eventually expose these capabilities through stable abstractions.

---

## 13. Architectural decisions SHALL be recorded

Material architecture changes SHALL require an Architecture Decision Record.

Accepted ADRs SHALL NOT be silently rewritten to conceal architectural change.

Changed decisions SHALL be represented by a new ADR which supersedes the previous decision.

---

## 14. Security SHALL take precedence over convenience

Implementation shortcuts SHALL NOT introduce:

- committed secrets;
- unnecessary production privileges;
- mutable trust dependencies;
- unrestricted cloud credentials;
- uncontrolled deployment paths.

---

## 15. Evidence SHALL accompany implementation

Every milestone SHALL provide reproducible implementation evidence sufficient for:

- technical review;
- troubleshooting;
- portfolio demonstration;
- interview discussion.

---

## 16. Local-development portability

The primary development workstation is currently:

- macOS 26.6.2;
- Intel x86_64;
- Bash.

Platform automation intended for CI SHALL target explicit and reproducible Linux/Bash execution unless another runtime is intentionally selected.

Local convenience SHALL NOT create macOS-only CI behaviour.

