---
id: ADR-0160
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0330]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0160. Auto-save and format-on-save read the editor keys

## Decision

The auto-save and format-on-save toggles read `editor.auto_save` and `editor.format_on_save`. (from docs/02-CONFIGURATION.md:187-188, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The docs give none beyond avoiding a duplicate key.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Duplicate them under `toggles` | every toggle in one table | two keys for one setting |

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
