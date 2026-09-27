---
id: ADR-0020
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0100]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0020. Language servers use the Neovim 0.12 native LSP API

## Decision

Servers are declared with `vim.lsp.config()` and started with `vim.lsp.enable()`. (from https://github.com/meowshed/meowvim/pull/45; lua/plugins/nvim-lspconfig.lua:10, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

nvim-lspconfig v2 deprecates `.setup()`.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: `lspconfig.setup()` | worked on older Neovim | deprecated in nvim-lspconfig v2 and replaced by the native API |

## What it costs

The configuration can't run on Neovim older than 0.11.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. `lua/plugins/nvim-lspconfig.lua:215-262` uses the native API.

## What this does not settle

- Anything beyond the choice the source records.
