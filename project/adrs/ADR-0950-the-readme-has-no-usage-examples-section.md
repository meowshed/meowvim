---
id: ADR-0950
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0883]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0950. The README has no usage-examples section

## Decision

The README ends its user path at "Getting started" and leaves workflows to `docs/03-WORKFLOWS.md`. (from https://github.com/meowshed/meowvim/pull/4#discussion_r2213640136, high)

## Why

The owner asked to remove the section in review of #4.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| A usage-examples section (issue #1) | examples on the first page | the owner removed it |

## What it costs

Not recorded in the sources.

## What would reverse it

- A source records that the need it serves has changed.

## Consequences

`REQ-0895` is withdrawn.

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
