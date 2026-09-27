---
id: ADR-0510
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0990]
supersedes: [ADR-0390]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0510. The repository keeps its harness files

## Decision

`CLAUDE.md` and `.meowpaw/` stay in the repository as its harness, beside `project/`. (from Imposed by the owner's answer of 2026-09-27 to the onboarding gaps., high)

## Why

The owner chose on 2026-09-27 to keep the harness that onboarding installed.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: keep `ADR-0390` and remove the files | no agent configuration in the tree | the record, the profile and the constitution would have no home |

## What it costs

The repository carries configuration for one AI agent's harness.

## What would reverse it

- The repository stops using the harness.

## Consequences

`ADR-0390` is superseded.

## How I will know it was realised

1. `CLAUDE.md` and `.meowpaw/profile.toml` are tracked on `main`.

## What this does not settle

- Which other agent configuration may be added.
