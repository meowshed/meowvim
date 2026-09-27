---
id: BUG-0250
artifact: bug
status: approved
severity: minor
violates: REQ-0889
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 82
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The README has no build-status badge

## Reproduction

At the head of `chore/onboard-record`.

1. Read the badges at `README.md:3-5`.

## What the system does

The README shows Neovim, licence and stars badges, and none for the CI build.

## What it should do, and why

The README shows the build status, as `REQ-0889` requires.

## Triage

It enters at implement. Minor, because only the README's front matter is affected.

## Closed by

Not closed: no fix and no regression check exist yet.
