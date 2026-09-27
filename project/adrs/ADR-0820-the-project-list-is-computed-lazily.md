---
id: ADR-0820
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0340]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0820. The project list is computed lazily

## Decision

The project list is computed when the picker opens, and the picker's own `cwd` filter is used. (from https://github.com/meowshed/meowvim/pull/37, high)

## Why

It lets the config refresh without a restart.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| An eager list built at load | computed once | edits needed a restart |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded with `~/.meowvim.yaml`; `projects.lua` is watched and reloaded.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
