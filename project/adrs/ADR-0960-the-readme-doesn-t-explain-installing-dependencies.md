---
id: ADR-0960
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0882]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0960. The README doesn't explain installing dependencies

## Decision

The README lists the prerequisites but not how to install each one. (from https://github.com/meowshed/meowvim/pull/4#discussion_r2213639032, high)

## Why

The owner said it isn't needed.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Platform-specific install steps | a complete path for every platform | the owner removed them in review of #4 |

## What it costs

Not recorded in the sources.

## What would reverse it

- A source records that the need it serves has changed.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
