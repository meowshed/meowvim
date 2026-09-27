---
id: ADR-0830
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0698]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0830. The crates source applies only to Cargo.toml

## Decision

The crates completion source is registered for `Cargo.toml` only. (from https://github.com/meowshed/meowvim/pull/39, high)

## Why

Registering it for the `toml` filetype covered every TOML file.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `cmp.setup.filetype("toml")` | simpler | crate completions in every TOML file |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded when completion moved to blink.cmp and crates' in-process language server.

## How I will know it was realised

1. It was realised in the pull request cited above and later reversed.

## What this does not settle

- Recorded after the fact during onboarding, from the GitHub history.
