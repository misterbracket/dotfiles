function sessionizer() {
  SESSION_CWD=$(fd . ~/myCode --maxdepth 2 --type directory | fzf --print-query)
  SESSION_NAME=$(basename $SESSION_CWD | tr . _)


  DIRECTORY_EXISTS=$(fd . ~/myCode --maxdepth 2 --type directory | grep -c "$SESSION_CWD")

  if [ $DIRECTORY_EXISTS -eq 0 ]; then
    mkdir -p ~/myCode/private/$SESSION_CWD
    SESSION_CWD=~/myCode/private/$SESSION_CWD
    echo "Created new directory $SESSION_CWD"
  fi

  #Creates a new Zellij Sessions in selected directory
  #It automatically detects if a session exists already and reattaches to it
  zellij options \
  	--attach-to-session true \
  	--session-name "$SESSION_NAME" \
  	--default-cwd "$SESSION_CWD"
}

bindkey -s ^f "sessionizer\n"
