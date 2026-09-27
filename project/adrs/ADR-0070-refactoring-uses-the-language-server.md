---
id: ADR-0070
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0070. Refactoring uses the language server

## Decision

Refactoring goes through the language server's code actions and rename. (from https://github.com/meowshed/meowvim/pull/24, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The built-in LSP code actions and rename are more robust.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| refactoring.nvim | refactors that servers don't offer | less robust than the server's own code actions |

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
