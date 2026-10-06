# Trust Boundaries

## Boundary 1 — Developer and Source Input

Developer-controlled source changes are untrusted until validated.

Pull-request code must not automatically obtain privileged credentials.

## Boundary 2 — CI Platform

Reusable workflows form part of the trusted software supply chain.

Changes to platform workflows may affect every consuming service and therefore require strong governance.

## Boundary 3 — Artifact Registry

Only validated release artefacts should become eligible for promotion.

Content digest shall be the authoritative artefact identity.

## Boundary 4 — GitOps Desired State

The GitOps repository represents authorised deployment intent.

Production-path changes require deliberate governance.

## Boundary 5 — Argo CD

Argo CD is the deployment reconciliation component.

It consumes authorised Git state and reconciles Kubernetes.

## Boundary 6 — Kubernetes Admission

Admission policy provides a final enforcement boundary before workload execution.

## Credential Boundary

Credentials shall not flow between trust domains unless required.

Short-lived federated identity is preferred over static secrets.

## Pull-Request Boundary

Untrusted pull requests must not inherit privileged production capabilities merely because CI executes them.

