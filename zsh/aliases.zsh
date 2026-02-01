# ALIASES ---------------------------------------------------------------------

# TMUX
alias ta='tmux attach -t'
alias tn='tmux new'

# Directory Navigation
alias la='lsd -a'
alias l='lsd -l'
alias ll='lsd -lar'

# CLI Tools
alias cat='bat'
alias top='btop'
alias v='nvim'
alias lzg='lazygit'
alias lzd='lazydocker'

# Dotfiles
alias ba='bat $DOTFILES/zsh/aliases.zsh'
alias rc='$DOTFILES/install/bootstrap.sh'

# Intellij
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
