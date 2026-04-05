# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Bootstrap

```bash
chezmoi init git@emma-gh:emmaisasleep/dotfiles.git
chezmoi apply
```

> `~/.ssh/config` (containing the `emma-gh` host alias) must already exist before
> the git remote will resolve. On a truly fresh machine, clone via HTTPS first,
> apply, then re-add the remote.

## Managed files

<!-- AUTO-GENERATED: chezmoi managed -->
| File | Purpose |
|------|---------|
| `~/.bashrc` | Shell options, PATH, env vars, tool init (Starship, Zoxide, FNM) |
| `~/.bash_aliases` | Single-line aliases — navigation, git shortcuts, tool wrappers |
| `~/.bash_functions` | Multi-line shell functions (`_` prefix, paired with aliases) |
| `~/.bash_logout` | Login shell cleanup |
| `~/.profile` | Login shell initialization |
| `~/.gitconfig` | Global git identity and settings |
| `~/.ssh/config` | SSH host aliases (includes `emma-gh` for this repo's remote) |
| `~/.config/starship.toml` | Starship prompt — Catppuccin Macchiato theme |
| `~/.config/helix/config.toml` | Helix editor settings |
| `~/.config/bat/` | bat syntax highlighter — Catppuccin Macchiato theme |
| `~/.config/git/ignore` | Global gitignore |
| `~/.local/share/bash-completion/completions/fnm` | FNM tab completions |
<!-- END AUTO-GENERATED -->

## Tools

All tools use the **Catppuccin Macchiato** color scheme.

| Tool | Purpose |
|------|---------|
| [Helix](https://helix-editor.com) | Primary editor (`hx`) — local build, runtime at `~/src/helix/runtime` |
| [Starship](https://starship.rs) | Shell prompt |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` (`z`, `zi`) |
| [FNM](https://github.com/Schniz/fnm) | Node.js version manager |
| [bat](https://github.com/sharkdp/bat) | Syntax-highlighted file viewer (aliased as `cat`) |