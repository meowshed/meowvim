---
id: ADR-0880
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0699]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0880. Code lens runs on demand

## Decision

Code lenses aren't shown automatically; `<leader>cl` runs them. (from https://github.com/meowshed/meowvim/pull/36; https://github.com/meowshed/meowvim/pull/24, high)

## Why

Global code lens added startup latency and visual noise.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Code lens in every buffer | lenses always visible | startup latency and noise |

## What it costs

Not recorded in the sources.

## What would reverse it

- A source records that the need it serves has changed.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
