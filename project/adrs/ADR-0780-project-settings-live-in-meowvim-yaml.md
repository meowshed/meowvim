---
id: ADR-0780
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0355]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0780. Project settings live in ~/.meowvim.yaml

## Decision

Per-project settings are read from `~/.meowvim.yaml`, through a small parser whose limits are documented. (from https://github.com/meowshed/meowvim/pull/36; https://github.com/meowshed/meowvim/pull/39; https://github.com/meowshed/meowvim/pull/41, high)

## Why

Project settings such as themes otherwise needed paths hardcoded in Lua.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Project paths hardcoded in Lua | no parser | every project needed a code change |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by `~/.config/meowvim/projects.lua`.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
