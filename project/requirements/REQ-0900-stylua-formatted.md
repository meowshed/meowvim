---
id: REQ-0900
artifact: requirement
topic: repo
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: static
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0900

Every Lua file under `lua/` and `init.lua` MUST pass `stylua --check` with the settings in `.stylua.toml`.

(from CLAUDE.md:26-31; .github/workflows/ci.yml:24, high)
