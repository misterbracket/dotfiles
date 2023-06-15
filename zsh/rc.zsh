source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
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


# P10K CONFIG
#
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
#
# ZSH_THEME="powerlevel10k/powerlevel10k"
# source ~/powerlevel10k/powerlevel10k.zsh-theme
#
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Starship
eval "$(starship init zsh)"

# Old Config to clean up


export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Needs to be loaded toward the end
source_if_exists ~/.fzf.zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export PATH=$PATH:/Users/maximilian.klammer/myCode/pleo/terraform/bin


PATH=$(pyenv root)/shims:$PATH 
if [ -f '/Users/maximilian.klammer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/maximilian.klammer/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/maximilian.klammer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/maximilian.klammer/google-cloud-sdk/completion.zsh.inc'; fi

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

export PNPM_HOME="/Users/maximilian.klammer/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

