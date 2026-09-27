---
id: ADR-0800
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0355]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0800. Project commands run after a delay

## Decision

Project commands run after a configurable delay, 200 ms by default. (from https://github.com/meowshed/meowvim/pull/40; https://github.com/meowshed/meowvim/pull/41, high)

## Why

Documented as an empirical choice.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| A `DirChanged` autocmd | no timing guess | the bot suggested it twice; the author kept the delay |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded with `~/.meowvim.yaml`; `projects.lua` runs `on_open` 100 ms after switching.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
