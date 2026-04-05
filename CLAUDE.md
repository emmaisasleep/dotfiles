# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Chezmoi Conventions

Files in this repo map to `$HOME` via chezmoi's naming conventions:
- `dot_` prefix → `.` (e.g., `dot_bashrc` → `~/.bashrc`)
- `private_dot_` prefix → private dotfile with restricted permissions
- `dot_config/` → `~/.config/`
- `private_dot_local/` → `~/.local/` (private)

After editing files here, apply changes with:
```
chezmoi apply
```

To preview what would change without applying:
```
chezmoi diff
```

To re-add a file from the live home directory into this repo:
```
chezmoi add ~/.bashrc
```

## Shell Config Division

The three bash files have distinct roles — put new content in the right place:

| File | Purpose |
|------|---------|
| `dot_bashrc` | Shell options, history, PATH, env vars (`EDITOR`, `HELIX_RUNTIME`, `LESS`), Starship/Zoxide/FNM init, sources the other two files |
| `dot_bash_aliases` | Single-line aliases only — navigation, git shortcuts, tool wrappers |
| `dot_bash_functions` | Multi-line functions with `_` prefix (e.g., `_update`), each paired with an alias in `dot_bash_aliases` |

## Structure

- `dot_bashrc`, `dot_bash_aliases`, `dot_bash_functions` — bash shell configuration (see above)
- `dot_config/starship.toml` — Starship prompt (Catppuccin Macchiato theme)
- `dot_config/helix/config.toml` — Helix editor theme
- `dot_config/bat/` — bat (cat replacement) theme
- `dot_config/git/ignore` — global gitignore
- `private_dot_local/share/bash-completion/completions/fnm` — FNM tab completions
- `.chezmoiignore` — prevents `*.md` files from being deployed to `$HOME`

## Key Tools Configured

- **Helix** — primary editor (`hx`), set via `HELIX_RUNTIME`
- **Starship** — prompt, initialized in `.bashrc`
- **Zoxide** — smart `cd`, initialized in `.bashrc`
- **FNM** — Node.js version manager with `--use-on-cd`
- **bat** — syntax-highlighted file viewer (replaces `cat`)

All tools use the **Catppuccin Macchiato** color scheme.

## Workflow Notes

- A PostToolUse hook in `.claude/settings.local.json` runs `chezmoi diff` automatically after every file edit — check its output to see pending `$HOME` changes before running `chezmoi apply`.
- `HELIX_RUNTIME` points to `$HOME/src/helix/runtime` (local build, not system package).
- Reload shell config after editing: `source ~/.bashrc` or use the `reload` alias.
