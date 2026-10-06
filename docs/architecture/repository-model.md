# Repository Model

The platform uses a multi-repository architecture.

## Repository 1 — cicd-platform-engineering-lab

Purpose:

- reusable CI/CD platform capabilities;
- workflow APIs;
- common security controls;
- templates;
- platform policy;
- platform observability;
- architecture and governance.

## Repository 2 — cicd-reference-service

Purpose:

- reference workload;
- demonstration of platform consumption;
- testing of the developer experience.

The service repository should contain minimal delivery implementation.

## Repository 3 — cicd-gitops-environments

Purpose:

- environment desired state;
- authorised release promotion;
- environment-specific declarative configuration.

## Rationale

Separating source code, platform implementation and deployment desired state establishes clearer:

- ownership;
- permission boundaries;
- lifecycle boundaries;
- audit trails;
- security boundaries.

## Explicit Non-Goal

The lab will not collapse all application, platform and production desired state into a single repository merely for implementation convenience.

