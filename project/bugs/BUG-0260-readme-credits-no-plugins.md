---
id: BUG-0260
artifact: bug
status: approved
severity: minor
violates: REQ-0893
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 83
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The README credits none of the plugins it uses

## Reproduction

At the head of `chore/onboard-record`.

1. Search `README.md` for acknowledgments or credits.

## What the system does

The README has no acknowledgments section and credits no plugin; its sections are listed at `README.md:1-132`.

## What it should do, and why

The README credits the plugins, as `REQ-0893` requires.

## Triage

It enters at implement. Minor, because it affects credit, not behaviour.

## Closed by

Not closed: no fix and no regression check exist yet.
