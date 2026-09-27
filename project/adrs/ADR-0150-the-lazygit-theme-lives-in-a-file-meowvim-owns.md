---
id: ADR-0150
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0420]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0150. The lazygit theme lives in a file meowvim owns

## Decision

The generated lazygit theme is written under `stdpath("state")` and layered over the user's config through `LG_CONFIG_FILE`. (from docs/02-CONFIGURATION.md:140-142, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The user's lazygit config is often a symlink into a dotfiles tree.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Edit the user's `config.yml` | one file | it writes into a dotfiles tree, and writing a theme name produced invalid YAML |

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
