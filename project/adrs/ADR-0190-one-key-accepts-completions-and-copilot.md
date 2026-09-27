---
id: ADR-0190
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0550, REQ-0560]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0190. One key accepts completions and Copilot

## Decision

`<C-l>` accepts the Copilot suggestion when one is showing and the selected completion otherwise. `<CR>` never accepts, and the menu doesn't preselect. (from docs/KEYMAPS.md:378-380; https://github.com/meowshed/meowvim/pull/49; https://github.com/meowshed/meowvim/pull/50, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

One accept key avoids conflicts between the two ghost-text renderers.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `<C-y>` for Copilot | Vim's usual accept key | the completion popup swallowed it |
| Preselect the first item | fewer keystrokes | Enter or accept could take an item the user didn't choose |

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
