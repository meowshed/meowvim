---
id: ADR-0850
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0921, REQ-0922, REQ-0923, REQ-0924, REQ-0925, REQ-0926, REQ-0927, REQ-0928]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0850. Files carry a full MIT licence header

## Decision

Every relevant file carries a header with the full MIT notice, `@file` and `@brief`. (from https://github.com/meowshed/meowvim/issues/23; https://github.com/meowshed/meowvim/pull/25, high)

## Why

Issue #23 asked for one standard header.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| No standard header | less noise | headers were inconsistent |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by the SPDX line that `REQ-0920` requires.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
