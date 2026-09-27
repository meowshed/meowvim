---
id: ADR-0090
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0690]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0090. The rust-analyzer didSave workaround is scoped to 1.96

## Decision

didSave is suppressed only when rust-analyzer reports version 1.96. Any other version, including one that reports none, keeps didSave. (from TODO.md:24-34, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

rust-analyzer 1.96.0 panicked on didSave, but suppressing it also stops `checkOnSave`, so cargo diagnostics never appear on write.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Suppress didSave on every version | no version matching | every other version would lose cargo diagnostics on write |

## What it costs

The workaround is untested against a live 1.96 server.

## What would reverse it

- The panic returns on a version the guard doesn't match; then the match is widened in `lua/plugins/rustaceanvim.lua`.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
