---
id: ADR-0240
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0940]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0240. luacheck comes from luarocks

## Decision

Contributors install luacheck with `luarocks install luacheck` on the mise Lua. (from mise.toml:8-9; README.md:126-127; https://github.com/meowshed/meowvim/pull/55, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

lunarmodules publishes luacheck binaries only for Linux x86-64 and Windows, so mise installed a Linux binary on macOS.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| The `github:lunarmodules/luacheck` entry in `mise.toml` | one `mise install` for everything | the binary doesn't run on macOS |

## What it costs

Contributors run one command beyond `mise install`.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
