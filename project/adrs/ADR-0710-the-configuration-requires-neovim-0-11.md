---
id: ADR-0710
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0101]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0710. The configuration requires Neovim 0.11

## Decision

The minimum Neovim version is 0.11. (from https://github.com/meowshed/meowvim/pull/42, high)

## Why

The native LSP API needs 0.11.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Neovim 0.10 | more users | no `vim.lsp.config` |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by the 0.12 floor that `REQ-0100` states.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
