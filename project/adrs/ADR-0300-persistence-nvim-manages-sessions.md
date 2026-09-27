---
id: ADR-0300
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0700]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0300. persistence.nvim manages sessions

## Decision

Sessions are saved and restored by persistence.nvim. (from https://github.com/meowshed/meowvim/pull/32, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Pull request #32 moved to more modern, faster and modular plugins.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| auto-session | restores automatically on its own | replaced as part of the move to faster, modular plugins |

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
