---
id: BUG-0140
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 70
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The test script prints a table address in place of validation errors

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Put an invalid config, `return { editor = { tabstop = 99 } }`, where the test script finds it.
2. Run `bash bin/test-config.sh`.

## What the system does

Test 3 fails with "User config validation failed: table: 0x010806d590". `bin/test-config.sh:102` prints `tostring(err)`, and `validate()` returns its errors as a table.

## What it should do, and why

The failure lists the validation errors. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because the test still fails when it should; only the message is useless.

## Closed by

Not closed: no fix and no regression check exist yet.
