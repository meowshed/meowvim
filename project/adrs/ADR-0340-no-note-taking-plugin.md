---
id: ADR-0340
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0750]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0340. No note-taking plugin

## Decision

meowvim installs no note-taking plugin. (from https://github.com/meowshed/meowvim/pull/32; https://github.com/meowshed/meowvim/pull/30, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Pull request #32 removed neorg "due to a re-evaluation of the note-taking approach".

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| neorg | structured notes inside Neovim | removed after the note-taking approach was re-evaluated |

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
