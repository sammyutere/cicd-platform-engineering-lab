# CI/CD Platform Architecture

## Purpose

The CI/CD Platform Engineering Lab implements a secure, reusable, observable and progressively self-service software-delivery platform for Kubernetes workloads.

The platform — rather than the reference application — is the primary engineering product.

## Target Architecture

```text
Developer
    |
    v
Application Repository
    |
    | consumes
    v
Reusable CI Platform
    |
    +--> Lint
    +--> Test
    +--> Build
    +--> Vulnerability Scan
    +--> SBOM
    +--> Provenance
    +--> Sign
    |
    v
OCI Registry
    |
    | immutable digest
    v
GitOps Desired-State Repository
    |
    v
Argo CD
    |
    v
Kubernetes
    |
    +--> Admission Policy
    |
    +--> Workload Runtime
    |
    v
Prometheus / Grafana / Delivery Telemetry
```
## Repository Responsibilities

### cicd-platform-engineering-lab

Owns shared platform capabilities:
- reusable workflows;
- shared automation;
- security policy;
- workflow contracts;
- platform templates;
- platform scripts;
- platform observability;
- architecture documentation;
- engineering governance.

### cicd-reference-service

Will own:
- reference application source;
- service-specific tests;
- service-specific metadata;
- minimal workflow caller definitions.
The reference application shall consume the platform rather than duplicate it.

### cicd-gitops-environments

Will own authorised desired deployment state for:
- development;
- staging;
- production.

## Deployment Responsibility

CI produces trusted artefacts.
Git records authorised desired state.
Argo CD performs reconciliation.
Kubernetes executes workloads.

## Critical Security Boundary

CI shall not become the production Kubernetes control plane.
Direct imperative production deployment from ordinary CI workflows is prohibited by the engineering contract.
