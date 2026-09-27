---
id: ADR-0280
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0280. meowvim supports terminal Neovim only

## Decision

meowvim configures terminal Neovim and carries no GUI client settings or launcher scripts. (from https://github.com/meowshed/meowvim/pull/42; https://github.com/meowshed/meowvim/issues/10; https://github.com/meowshed/meowvim/pull/19; https://github.com/meowshed/meowvim/pull/47, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Pull request #42 removed Neovide support "to focus on core Neovim".

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Neovide support | a GUI client for users who want one | removed to focus on core Neovim, after being added and removed twice |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

The Raycast launcher scripts went with it in pull request #47.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
