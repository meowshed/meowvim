---
id: ADR-0920
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0615]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0920. Parsers install on demand

## Decision

Tree-sitter parsers install when a file first needs them, from a small list. (from https://github.com/meowshed/meowvim/pull/21, high)

## Why

Pre-installing every parser slowed the first start.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Pre-install every parser | ready immediately | a much slower first start |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by #22's installed list.

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
