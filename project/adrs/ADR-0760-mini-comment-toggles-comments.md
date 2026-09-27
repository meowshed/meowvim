---
id: ADR-0760
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0607]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0760. mini.comment toggles comments

## Decision

mini.comment and ts-comments.nvim toggle comments. (from https://github.com/meowshed/meowvim/pull/32, high)

## Why

Pull request #32 moved to faster, modular plugins.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Comment.nvim | the common choice | replaced as part of the same move |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: #54 removed ts-comments as unused, and no mini.comment spec remains.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
