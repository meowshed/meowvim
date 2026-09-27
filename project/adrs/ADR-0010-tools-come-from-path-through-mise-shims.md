---
id: ADR-0010
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0230, REQ-0240, REQ-0260]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0010. Tools come from PATH through mise shims

## Decision

External tools are found on `PATH` when they run, with the mise shims directory prepended at startup. Nothing installs a language server, formatter or linter from inside Neovim. (from CLAUDE.md:48-52; init.lua:15; commit 77ffb5f; https://github.com/meowshed/meowvim/pull/32, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

A project's own `mise.toml` then picks its tool versions, and a machine without a tool loses that one feature without an error at startup.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: Mason | installs tools from inside Neovim on any machine | a central install can't follow a project's own tool versions, and it installs from inside Neovim |
| Manual `executable()` checks per tool | no plugin dependency | pull request #32 moved away from them as scattered and hardcoded |

## What it costs

A user without mise or a similar tool manager installs every tool by hand.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. `init.lua:15-20` prepends the shims, and no plugin spec installs a tool.

## What this does not settle

- Anything beyond the choice the source records.
