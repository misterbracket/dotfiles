source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/nvim_config_switcher.zsh
source_if_exists $DOTFILES/zsh/sessionizer.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

. "$HOME/.asdf/asdf.sh"

if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi

autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

if test -z ${ZSH_HIGHLIGHT_DIR+x}; then
else
    source $ZSH_HIGHLIGHT_DIR/zsh-syntax-highlighting.zsh
fi

precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

export VISUAL=nvim
export EDITOR=nvim
export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"


# Load Starship
eval "$(starship init zsh)"

# ZSH Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH Syntax Highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Needs to be loaded toward the end
source_if_exists ~/.fzf.zsh


##########################
# Old Config to clean up #
##########################

export PATH=$PATH:/Users/maximilian.klammer/myCode/pleo/terraform/bin

PATH=$(pyenv root)/shims:$PATH 
if [ -f '/Users/maximilian.klammer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/maximilian.klammer/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/maximilian.klammer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/maximilian.klammer/google-cloud-sdk/completion.zsh.inc'; fi

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# Autogenerated by pnpm
# pnpm
export PNPM_HOME="/Users/maximilian.klammer/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/maximilian.klammer/.bun/_bun" ] && source "/Users/maximilian.klammer/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/maximilian.klammer/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
