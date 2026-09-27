---
id: ADR-0730
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0250]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0730. mason-lspconfig doesn't enable servers itself

## Decision

mason-lspconfig's automatic enabling is off, and meowvim's own loop sets up each server. (from https://github.com/meowshed/meowvim/pull/48, high)

## Why

Automatic enabling started every installed server with bare defaults before the loop ran.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| mason-lspconfig's automatic enabling | less code | servers started with bare defaults |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded when Mason was replaced by mise; see `ADR-0010`.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
