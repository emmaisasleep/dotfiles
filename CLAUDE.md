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
- `dot_gitconfig` — global git identity (`user.name`, `user.email`, `init.defaultBranch`, `pull.rebase`)
- `dot_profile`, `dot_bash_logout` — login shell init and logout script
- `private_dot_ssh/config` — SSH host aliases; includes `emma-gh` which the git remote for this repo uses (`git@emma-gh:emmaisasleep/dotfiles.git`). **Must be applied before git operations work on a new machine.**
- `dot_config/starship.toml` — Starship prompt (Catppuccin Macchiato theme)
- `dot_config/helix/config.toml` — Helix editor config (theme + relative line numbers, cursor shapes, bufferline)
- `dot_config/bat/` — bat theme (Catppuccin Macchiato, bundled as `.tmTheme`)
- `dot_config/git/ignore` — global gitignore (excludes `.claude/settings.local.json` from all repos)
- `private_dot_local/share/bash-completion/completions/fnm` — FNM tab completions
- `.chezmoiignore` — prevents `*.md` files from being deployed to `$HOME`

## Workflow Notes

- A PostToolUse hook in `.claude/settings.local.json` runs `chezmoi diff` automatically after every file edit — check its output to see pending `$HOME` changes before running `chezmoi apply`.
- `HELIX_RUNTIME` points to `$HOME/src/helix/runtime` (local build, not system package).
- Reload shell config after editing: `source ~/.bashrc` or use the `reload` alias.
- **`chezmoi add` requires a TTY** when `autoCommit=true` + `promptString` is configured in `~/.config/chezmoi/chezmoi.toml`. In non-interactive contexts (scripts, Claude Code bash), temporarily set `autoCommit = false`, run the add, then restore it — then commit manually.
- **`~/.config/chezmoi/chezmoi.toml` cannot be tracked** via `chezmoi add` (chezmoi refuses to manage its own config). Use a config template (`.chezmoi.toml.tmpl`) instead.
