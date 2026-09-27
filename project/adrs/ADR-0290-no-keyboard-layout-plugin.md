---
id: ADR-0290
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0290. No keyboard-layout plugin

## Decision

meowvim installs no plugin that switches keyboard layouts. (from https://github.com/meowshed/meowvim/pull/21; https://github.com/meowshed/meowvim/pull/22, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

xkbswitch.nvim was removed to simplify the configuration.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| xkbswitch.nvim | switches layout on mode change | removed to simplify the configuration |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Insert mode maps the Cyrillic `оо` to Escape instead, at `lua/config/keymaps.lua:1755`.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
