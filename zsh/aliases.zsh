# ALIASES ---------------------------------------------------------------------

# TMUX
alias ta='tmux attach -t'
alias tn='tmux new'

# Zellij
alias zel="zellij"
alias zela="zellij a"

# Directory Navigation
alias ..="cd .."
alias la="exa -a"
alias l="exa -l"
alias ll="exa -lar"

# NVIM
alias v='nvim-astro'

alias cat='bat'

alias staging="ssocred staging && export AWS_PROFILE=staging && kubectx eks-staging && export VAULT_ADDR=http://vault.k8s-product.vault.staging.internal"
alias data-staging="ssocred staging && export AWS_PROFILE=staging && kubectx eks-data-staging && export VAULT_ADDR=http://vault.k8s-product.vault.staging.internal"
alias production="ssocred production && export AWS_PROFILE=production && kubectx eks-production && export VAULT_ADDR=http://vault.k8s-product.vault.production.internal"
alias data-production="ssocred production && export AWS_PROFILE=production && kubectx eks-data-production && export VAULT_ADDR=http://vault.k8s-product.vault.production.internal"
alias cicd="ssocred cicd && export AWS_PROFILE=cicd && kubectx eks-cicd"

alias ba="bat $DOTFILES/zsh/aliases.zsh" 

alias rc="$DOTFILES/install/bootstrap.sh" 

# GIT ALIASES -----------------------------------------------------------------
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || exa'
alias gu='git reset --soft HEAD~1'
alias gpr='git remote prune origin'
alias ff='gpr && git pull --ff-only'
alias grd='git fetch origin && git rebase origin/master'
alias gbb='git-switchbranch'
alias gbf='git branch | head -1 | xargs' # top branch
alias gl=pretty_git_log
alias gla=pretty_git_log_all
alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(green)%an %ar %C(reset) %C(bold magenta)%d%C(reset)'"
#alias gla="git log --all --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(bold magenta)%d%C(reset)'"
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gec='git status | grep "both modified:" | cut -d ":" -f 2 | trim | xargs nvim -'
alias gcan='gc --amend --no-edit'

alias gp="git push -u 2>&1 | tee >(cat) | grep \"pull/new\" | awk '{print \$2}' | xargs open"
alias gpf='git push --force-with-lease'

alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'
alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'

# FUNCTIONS -------------------------------------------------------------------

take() {
  mkdir -p $1
  cd $1
}



