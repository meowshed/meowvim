---
id: ADR-0130
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0985]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0130. The update restore point is the lock file

## Decision

`bin/update-meowvim.sh` saves `lazy-lock.json` as its restore point. (from docs/01-INSTALLATION.md:143-144; bin/update-meowvim.sh:7-11, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

lazy.nvim pins every plugin to a commit there, and a lock file is a few kilobytes where the plugin directory is hundreds of megabytes.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Copy the plugin directory | restores without a network | hundreds of megabytes per restore point |

## What it costs

A rollback needs the network to fetch the pinned commits.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
