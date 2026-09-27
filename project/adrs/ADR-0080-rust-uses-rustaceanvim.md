---
id: ADR-0080
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0697]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0080. Rust uses rustaceanvim

## Decision

rustaceanvim runs rust-analyzer and clippy on save. (from https://github.com/meowshed/meowvim/pull/36, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

rustaceanvim's adapter is specialised for Rust.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Clippy on save through nvim-lspconfig | one LSP configuration for every language | the specialised adapter does it better |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
