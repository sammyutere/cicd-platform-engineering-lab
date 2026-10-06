# CI/CD Platform Engineering Lab

A production-oriented Platform Engineering project implementing a secure, reusable and observable software-delivery platform for Kubernetes workloads.

## Engineering Objective

The objective is not merely to build CI pipelines.

The objective is to engineer a shared delivery platform that application teams can consume without independently implementing:

- testing infrastructure;
- container-build logic;
- vulnerability scanning;
- SBOM generation;
- provenance;
- artefact signing;
- registry publication;
- environment promotion;
- GitOps deployment;
- delivery observability.

## Platform Architecture

```text
Developer
    |
    v
Application Repository
    |
    | consumes reusable platform API
    v
CI/CD Platform
    |
    +--> Test
    +--> Build
    +--> Scan
    +--> SBOM
    +--> Provenance
    +--> Sign
    |
    v
OCI Registry
    |
    | immutable digest
    v
GitOps Repository
    |
    v
Argo CD
    |
    v
Kubernetes
    |
    v
Observability
```
## Core Engineering Principles

1. CI and CD are separate responsibilities.
2. CI does not directly deploy production workloads.
3. Release artefacts are built once and promoted by immutable digest.
4. Shared workflows are versioned platform APIs.
5. Workflow permissions follow least privilege.
6. AWS authentication uses short-lived federated identity.
7. Trusted third-party Actions use immutable references.
8. Release artefacts acquire verifiable supply-chain evidence.
9. Git represents authorised deployment desired state.
10. Platform behaviour is observable.
11. Common services follow a supported Golden Path.
12. Architecture changes are recorded using ADRs.

## Repository Model

The target system consists of three principal repositories:

### cicd-platform-engineering-lab
Shared delivery-platform implementation and governance.

### cicd-reference-service
Reference application which consumes the platform.

### cicd-gitops-environments
Authoritative desired deployment state for development, staging and production.

### Current Milestone

Milestone 1 — CI/CD Platform Architecture & Engineering Contract

Milestone 1 establishes:
- platform requirements;
- architecture;
- trust boundaries;
- Architecture Decision Records;
- governance;
- executable acceptance criteria.

### Validation
Run:

```bash
make validate
```
Expected:

```text
Milestone 1 structural validation: PASS
```
Run the basic credential-pattern check with:

```bash
make secrets-check
```
