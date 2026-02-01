################################################################################
# Utilities
################################################################################

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

################################################################################
# Environment Variables
################################################################################

export VISUAL=nvim
export EDITOR=nvim
export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"

################################################################################
# Version Managers & Package Managers
################################################################################

# asdf
. "$HOME/.asdf/asdf.sh"

# Go with ASDF
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh

# direnv
if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


################################################################################
# Zsh Configuration
################################################################################

# Autoload functions
autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

# Edit command line in editor (Ctrl+x, Ctrl+e)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Vim mode
bindkey -v

# Reload aliases on every prompt
precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

################################################################################
# Shell Plugins
################################################################################

# ZSH Syntax Highlighting
if test -z ${ZSH_HIGHLIGHT_DIR+x}; then
else
    source $ZSH_HIGHLIGHT_DIR/zsh-syntax-highlighting.zsh
fi

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

################################################################################
# CLI Tools
################################################################################

# Starship prompt
eval "$(starship init zsh)"

# Zoxide (cd replacement)
eval "$(zoxide init zsh)"

# fzf (fuzzy finder)
source_if_exists ~/.fzf.zsh
source <(fzf --zsh)

# Atuin (better history)
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

# jj (Jujutsu VCS) autocompletions
source <(COMPLETE=zsh jj)

################################################################################
# Source Additional Configs
################################################################################

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/functions.zsh
source_if_exists $DOTFILES/zsh/keybindings.zsh
source_if_exists $DOTFILES/zsh/work.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/maximilian.klammer/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
