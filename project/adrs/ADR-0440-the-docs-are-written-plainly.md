---
id: ADR-0440
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0830]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0440. The docs are written plainly

## Decision

The documentation is plain and matter-of-fact, with no marketing language and no puns in technical docs. (from https://github.com/meowshed/meowvim/pull/4#issuecomment-3084435846; https://github.com/meowshed/meowvim/pull/47, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Clarity, following the "Write, cut" editing method.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Marketing language and taglines | personality | the owner asked to remove it in pull request #4 |
| Cat puns in the technical docs | the project's playful tone | pull request #47 removed them for clarity |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Whether the taglines the owner asked to keep in pull request #7, and the README's "Keep the cat puns tasteful", still stand.
