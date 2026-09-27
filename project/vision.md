---
id: vision
artifact: vision
status: live
revised: 2026-09-27
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# meowvim

This vision was recovered during onboarding from the README, the guides, `CLAUDE.md`, `TODO.md` and the GitHub history. Every statement names its source and how it was found. Where the sources are silent, it says so, and the onboarding report asks the question.

## What it is

meowvim is a Neovim configuration for Neovim 0.12 and later, built around snacks.nvim, blink.cmp and the native LSP client (from README.md:7 and doc/meowvim.txt:1, high). It keeps the user's own choices in one Lua file, `~/.config/meowvim/config.lua`, which it validates and reloads on save, while the repository holds the plugin specs (from README.md:7-9 and doc/meowvim.txt:27-29, high).

It takes the place of the user's existing Neovim configuration directory: the install moves that directory aside and clones meowvim there (from docs/01-INSTALLATION.md:18, high). The docs name no competing distribution. The owner names LazyVim and spacemacs as inspirations (from https://github.com/meowshed/meowvim/pull/4#issuecomment-3084435846, high), and it is also shipped as part of the owner's larger `meow` environment through the dotmeow module (from README.md:65-66 and https://github.com/meowshed/meowvim/issues/1, high). Why LazyVim or another distribution wasn't enough isn't recorded.

## The problem

A Neovim setup spreads its settings across many files, and every change means editing Lua and restarting. meowvim answers with one validated file that applies on save (from README.md:8-9 and docs/02-CONFIGURATION.md:8-9, high).

A developer who moves between projects needs each project's own tool versions. A configuration that installs tools itself, or resolves them once at startup, uses the wrong version the moment the working directory changes. meowvim finds tools on `PATH` when they run, so a project that brings its own toolchain works without a change here (from README.md:12-14 and CLAUDE.md:48-52, high).

Documentation drifts from a configuration one rename at a time, and the drift is invisible until someone follows an instruction that no longer works (from bin/check-docs.lua:12-13, high).

## Who it is for

| Audience | Wants | What they do today instead |
| -------- | ----- | -------------------------- |
| The owner, a single developer who writes Go, Python, TypeScript, C#, Rust, Lua and GDScript (from https://github.com/meowshed/meowvim/pull/4#issuecomment-3084435846, high; languages from README.md:43-44, medium) | one configuration that follows each project's toolchain | not recorded |
| Neovim users arriving from stock Neovim (from TODO.md:20-21, medium) | the built-in mappings they already know, with more on top | stock Neovim |
| Users of the owner's `meow` environment (from README.md:65-66, high) | an editor that switches theme together with the terminal | not recorded |

The sources don't say what the second and third audiences use today; the onboarding report asks.

## Quality goals

The sources state these goals but no priority among them, so this list isn't ordered; the onboarding report asks for the order.

- A missing tool costs that feature and nothing else, and a minimal install works (from docs/04-TROUBLESHOOTING.md:11-12 and docs/01-INSTALLATION.md:10-11, high).
- Startup stays fast: 17 of 83 plugins load at startup, and the last 100 startup times are kept to show regressions (from README.md:9-10, 34-35, high).
- The editor never blocks on appearance detection or on formatting a large file (from docs/02-CONFIGURATION.md:44-45 and docs/03-WORKFLOWS.md:62-63, high).
- Settings apply without a restart (from docs/02-CONFIGURATION.md:8-9, high).
- The docs name only mappings and commands that exist (from CLAUDE.md:40-45, high).
- Upgrades can be rolled back (from README.md:117-118, high).
- It behaves under terminal multiplexers such as tmux and Zellij (from https://github.com/meowshed/meowvim/pull/51, high).

## What it will not do

- It will not install language servers, formatters or linters from inside Neovim (from CLAUDE.md:49-50, high).
- It will not support GUI clients such as Neovide (from https://github.com/meowshed/meowvim/pull/42, high).
- It will not keep a persistent outline pane or a second diff plugin (from TODO.md:10-15, high).
- It will not choose which language servers start through the settings file (from docs/02-CONFIGURATION.md:96, high).
- It will not format files over 5000 lines (from docs/04-TROUBLESHOOTING.md:99-100, high).
- It will not test the native Windows build (from docs/01-INSTALLATION.md:67, high).

## Risks

- One person maintains it (from https://github.com/meowshed/meowvim/pull/4#issuecomment-3084435846, high), so its review happens mostly through automated reviewers (from the GitHub history, medium).
- It tracks Neovim 0.12 and nightly, and several fixes work around bugs in a specific Neovim or server version, such as the treesitter range patch and the rust-analyzer 1.96 guard (from lua/utils/patches.lua:10-12 and TODO.md:24-34, high).
- The code disagrees with the docs in places the onboarding report lists, such as user editor settings being overwritten at startup (from init.lua:26, 34, high).

## Where it is going

The sources record no roadmap. `TODO.md` says nothing is open as of its review against Neovim 0.12.5 (from TODO.md:3-6, high), and CI tests Neovim nightly beside stable (from .github/workflows/ci.yml:43, high).
