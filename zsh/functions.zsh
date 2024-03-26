function tmux-sessionizer() {
  $DOTFILES/sessionizer/session.sh
}

bindkey -s ^f "tmux-sessionizer\n"


function run() {
  $DOTFILES/run-pleo-moon/run-pleo-moon.sh
}
