---
id: ADR-0740
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0765]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0740. mini.tabline shows the buffers

## Decision

mini.tabline draws the open buffers as tabs. (from https://github.com/meowshed/meowvim/pull/32, high)

## Why

Pull request #32 moved to faster, modular plugins.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| bufferline.nvim | richer tabs | replaced as part of the move to mini.nvim |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: no tab line is configured now.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
