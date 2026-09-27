---
id: ADR-0720
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0680]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0720. Language servers find their root with root_dir

## Decision

Each server finds its root through `root_dir` with a list of markers per language. (from https://github.com/meowshed/meowvim/pull/46, high)

## Why

A reviewer said the native API didn't use `root_markers`.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `root_markers` | the native API's own option | the reviewer believed the native API ignored it |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: the code now uses a shared `root_markers` list (`lua/plugins/nvim-lspconfig.lua:215-262`).

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
