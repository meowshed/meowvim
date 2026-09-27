---
id: ADR-0750
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0605]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0750. ultimate-autopair pairs brackets

## Decision

ultimate-autopair.nvim closes brackets and quotes, with tabout and fastwarp. (from https://github.com/meowshed/meowvim/pull/32; https://github.com/meowshed/meowvim/pull/33, high)

## Why

Pull request #32 moved to faster, modular plugins, and #33 configured tabout and fastwarp.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| nvim-autopairs | the common choice | replaced as part of the same move |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by mini.pairs, because ultimate-autopair broke with Neovim 0.12.3 (`lua/plugins/mini-pairs.lua:7-9`).

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
