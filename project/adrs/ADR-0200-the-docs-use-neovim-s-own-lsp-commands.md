---
id: ADR-0200
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0800]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0200. The docs use Neovim's own LSP commands

## Decision

The docs point at `:lsp` and `:checkhealth vim.lsp`. (from docs/04-TROUBLESHOOTING.md:82-84, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

nvim-lspconfig doesn't define `:LspInfo` and its siblings when Neovim already has them.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `:LspInfo`, `:LspLog`, `:LspStart`, `:LspRestart`, `:LspStop` | familiar names | they don't exist under Neovim 0.12 with this configuration |

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
