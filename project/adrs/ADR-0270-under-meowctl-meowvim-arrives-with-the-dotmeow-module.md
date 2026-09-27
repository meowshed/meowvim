---
id: ADR-0270
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0270. Under meowctl, meowvim arrives with the dotmeow module

## Decision

A meowctl user gets meowvim through the dotmeow module. (from docs/01-INSTALLATION.md:72-73, 102-106, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

dotmeow brings the rest of the terminal environment with it, and its Ghostty theme uses the same Catppuccin pair so the editor and the terminal switch together.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Add meowvim as a standalone component by name | a smaller install | the docs give no reason beyond what dotmeow brings |

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
