---
id: ADR-0180
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0610]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0180. Large buffers format after the write

## Decision

Buffers longer than 800 lines are formatted asynchronously after the write. (from docs/03-WORKFLOWS.md:62-63, low)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The write then doesn't wait for the formatter.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Format every buffer during the write | the file on disk is always formatted | the write blocks on large buffers |

## What it costs

A large buffer is written unformatted and then modified again.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
