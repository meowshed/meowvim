---
id: ADR-0790
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0356, REQ-0357, REQ-0359]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0790. Project commands can't run Lua or chain commands

## Decision

Project commands reject `lua`, command chaining and newlines, but allow `;`. (from https://github.com/meowshed/meowvim/pull/37; https://github.com/meowshed/meowvim/pull/38; https://github.com/meowshed/meowvim/pull/39; https://github.com/meowshed/meowvim/pull/41, high)

## Why

To prevent arbitrary code execution through the config file; `;` isn't a Vim command separator.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Allow `lua` and chaining | more powerful project hooks | arbitrary code execution through a config file |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded with `~/.meowvim.yaml`: `on_open` in `projects.lua` runs any Ex command.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
