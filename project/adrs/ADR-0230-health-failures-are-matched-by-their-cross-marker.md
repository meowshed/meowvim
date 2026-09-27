---
id: ADR-0230
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0930]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0230. Health failures are matched by their cross marker

## Decision

The test and update scripts look for the health report's cross marker, not the word "ERROR". (from bin/update-meowvim.sh:81-83; bin/test-config.sh:80-81, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

"ERROR" also appears inside warning texts, such as the message a mise shim prints when no version is set.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Match "ERROR" | simpler to read | it fails on warnings |

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
