# Non-Functional Requirements

| ID | Requirement |
|---|---|
| NFR-001 | Long-lived AWS access keys shall not be the normal CI/CD authentication mechanism. |
| NFR-002 | Workflow permissions shall follow explicit least privilege. |
| NFR-003 | Release artefacts shall be promoted immutably. |
| NFR-004 | CI behaviour shall be reproducible. |
| NFR-005 | Shared workflow interfaces shall be versioned. |
| NFR-006 | Releases shall be auditable. |
| NFR-007 | The delivery process shall maintain software supply-chain integrity. |
| NFR-008 | Infrastructure and deployment configuration shall be declarative where practical. |
| NFR-009 | Rollback capability shall be tested rather than assumed. |
| NFR-010 | Platform architecture shall support multiple consuming application teams. |
| NFR-011 | Platform operation shall be observable. |
| NFR-012 | Failures in one consuming service should not automatically compromise unrelated services. |
| NFR-013 | Platform abstractions shall minimise application-team cognitive load. |
| NFR-014 | Significant architecture decisions shall be recorded using ADRs. |
| NFR-015 | Every milestone shall retain reproducible implementation evidence. |
| NFR-016 | Trusted external Actions shall ultimately use immutable references. |
| NFR-017 | CI automation shall not depend unintentionally on developer-workstation-specific behaviour. |
| NFR-018 | Security controls should fail closed where technically appropriate. |
