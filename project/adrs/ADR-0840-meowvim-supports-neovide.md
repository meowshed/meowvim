---
id: ADR-0840
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0111, REQ-0112, REQ-0113, REQ-0114, REQ-0115, REQ-0116]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0840. meowvim supports Neovide

## Decision

meowvim configures the Neovide GUI client, with its own keys and settings. (from https://github.com/meowshed/meowvim/issues/10; https://github.com/meowshed/meowvim/pull/19, high)

## Why

Issue #10 asked for GUI client configuration.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Terminal Neovim only | one target | issue #10 asked for a GUI |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded by `ADR-0280`: #42 removed Neovide support to focus on core Neovim.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
