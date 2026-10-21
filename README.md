# terminal_setup

On some projects I do almost all of my work with AI agents on remote machines, so I spend most of my time in the terminal.
This repo saves my terminal environment so I can restore it quickly on any machine. It doesn't include AI agent configuration, because that changes from project to project.

My terminal development environment: **Neovim (NvChad)** + **tmux** + a session script.

## Layout

Each top-level folder is a [GNU Stow](https://www.gnu.org/software/stow/) package that mirrors `$HOME`:

| Package | Installs to |
|---|---|
| `nvim/` | `~/.config/nvim` (NvChad v2.5 custom config, plugin versions pinned in `lazy-lock.json`) |
| `tmux/` | `~/.tmux.conf` |
| `bin/`  | `~/.local/bin/` (tmux session script) |

## Requirements

- Neovim ≥ 0.10
- tmux
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) in your terminal (WezTerm falls back to its built-in Nerd Font symbols for icons)
- GNU Stow (`install.sh` installs it via brew/apt if missing)

## Install

```sh
git clone <repo-url> ~/dev/terminal_setup
cd ~/dev/terminal_setup
./install.sh
```

`install.sh` is safe to re-run. Existing non-symlinked configs are moved to `*.bak.<timestamp>`.

## Local overrides

Anything machine-specific or private goes in untracked files:

- `~/.tmux.local.conf`: sourced at the end of `.tmux.conf`

## Session script

Creates a named tmux session, or attaches to it if it already exists:

```sh
tmux-session <name>
```

<!-- TODO: add script to bin/.local/bin/ and document its options -->
