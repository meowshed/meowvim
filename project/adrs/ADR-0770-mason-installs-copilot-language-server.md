---
id: ADR-0770
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0205]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0770. Mason installs copilot-language-server

## Decision

copilot-language-server is installed through mason-registry. (from https://github.com/meowshed/meowvim/pull/53, high)

## Why

Listed as a fix in #53, with no further reason.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| mason-lspconfig | one install path for servers | #53 gives no reason |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded when the configuration stopped installing tools; see `ADR-0010`.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
