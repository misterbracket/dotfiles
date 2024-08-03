# ALIASES ---------------------------------------------------------------------

# TMUX
alias ta='tmux attach -t'
alias tn='tmux new'

# Zellij
alias zel='zellij'
alias zela='zellij a'

# Directory Navigation
# alias ..='cd ..'
alias la='lsd -a'
alias l='lsd -l'
alias ll='lsd -lar'

alias cat='bat'

# NVIM
alias v="NVIM_APPNAME=LazyVim nvim"

alias lg='lazygit'

alias ba='bat $DOTFILES/zsh/aliases.zsh' 

alias rc='$DOTFILES/install/bootstrap.sh' 

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
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || lsd'
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


vmrss() {
    p=$1
    while true; do sync; ps -o rss= -p $1 | awk '{print $1/1024 " MB"}'; sleep 1; done
}

# Usage: addToPath /Users/maximilian.klammer/myCode/migration_scripts
# Then call the script from anywhere e.g  my_script.sh
# Somtimes there are issues then just kill and start an new terminal
addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi

}


#Kill Docker Container by exposed Port
dkill() {
    container_id=$(docker ps --format "{{.ID}}\t{{.Ports}}" | awk -F'\t' -v port="$1" '$2 ~ "->" port "/tcp" {print $1}')
     if [ -z "$container_id" ]; then
        echo "No container found with exposed port $1"
    else
        docker kill "$container_id"
        echo "Container $container_id killed"
    fi
}


function tmux-sessionizer() {
  $DOTFILES/sessionizer/session.sh
}

bindkey -s ^f "tmux-sessionizer\n"


