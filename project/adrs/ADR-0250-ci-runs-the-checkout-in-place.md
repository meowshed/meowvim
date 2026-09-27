---
id: ADR-0250
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0900, REQ-0910]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0250. CI runs the checkout in place

## Decision

CI symlinks the checkout into `~/.config/nvim`. (from .github/workflows/ci.yml:70-71, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Copying it would drop the dotfiles that stylua and luacheck read.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Copy the checkout | isolates the run from the workspace | the copy loses the dotfiles |

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
