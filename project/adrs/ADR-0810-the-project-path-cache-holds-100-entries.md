---
id: ADR-0810
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0358]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0810. The project path cache holds 100 entries

## Decision

The path cache holds at most 100 entries, evicted in insertion order. (from https://github.com/meowshed/meowvim/pull/41, high)

## Why

An unbounded cache grew with every path.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| A 30-minute expiry timer | evicts stale entries | a size bound was simpler |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded with `~/.meowvim.yaml`.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
