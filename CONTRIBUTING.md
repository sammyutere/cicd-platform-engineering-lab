# Contributing

This repository represents shared delivery-platform infrastructure.

Changes therefore require stronger discipline than ordinary application feature changes.

## Architecture

Material architectural changes require an ADR.

Accepted architectural history must not be silently rewritten.

## Reusable Workflow Compatibility

Reusable workflow inputs, outputs and behaviour are platform APIs.

Breaking changes require deliberate version evolution.

## Security

Never commit:

- passwords;
- API tokens;
- private keys;
- AWS access keys;
- cloud credential files;
- signing private keys;
- unredacted sensitive configuration.

## Least Privilege

New workflow permissions must be justified.

Privileges must not be added merely to make an implementation easier.

## Testing

Platform changes must include appropriate automated or reproducible validation.

## Evidence

Each milestone must retain enough evidence to reproduce and explain the implementation.

## Portability

Automation intended for GitHub-hosted Linux runners shall not accidentally depend on macOS-specific tools or behaviour.

