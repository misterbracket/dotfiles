# Dotfiles

Personal macOS development environment configs using modular tool-specific directories and symlink-based installation.

[Architecture details](https://shaky.sh/simple-dotfiles/)

## What's Included

- **Shell**: zsh + starship prompt + atuin history + fzf
- **Editors**: LazyVim (Neovim), IntelliJ ideavimrc
- **Terminal**: ghostty + tmux
- **Git**: lazygit, git-delta, jujutsu (jj)
- **Window Manager**: AeroSpace (macOS tiling)
- **Tools**: asdf, zoxide, ripgrep, fd, bat, btop, lazydocker

## Install

```bash
git clone <this-repo>
cd <this-repo>
./install/install-deps-macos.sh  # Homebrew packages
./install/install-deps.sh        # asdf, Node.js, zsh plugins, TPM
./install/bootstrap.sh           # Symlink configs via links.prop
```

## Structure

Each tool has its own directory with:
- Config files
- `links.prop` - defines symlink mappings (source=target)

`bootstrap.sh` reads all `links.prop` files and creates symlinks to `$HOME`.

## Customization

Machine-local config (not committed): `~/.env.sh`

Loaded at zsh startup. Use for machine-specific paths, secrets, work configs.
