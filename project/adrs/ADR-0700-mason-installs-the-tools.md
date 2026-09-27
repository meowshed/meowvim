---
id: ADR-0700
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0220]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0700. Mason installs the tools

## Decision

Mason provides tool binaries and their paths from a central registry. (from https://github.com/meowshed/meowvim/pull/32, high)

## Why

Pull request #32 moved away from manual `executable()` checks and hardcoded paths.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Manual `executable()` checks per tool | no plugin | scattered checks and hardcoded paths |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by mise shims on `PATH`, which `ADR-0010` records.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
