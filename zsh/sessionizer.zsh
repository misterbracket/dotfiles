function sessionizer() {
  SESSION_CWD=$(fd . ~/myCode --maxdepth 2 --type directory | fzf)
  SESSION_NAME=$(basename $SESSION_CWD | tr . _)


#TODO: If directory does not exist create new directory in ~/myCode/private
# with the fzf search term and set the SESSION_CWD to the search term

  #Creates a new Zellij Sessions in selected directory
  #It automatically detects if a session exists already and reattaches to it
  zellij options \
  	--attach-to-session true \
  	--session-name "$SESSION_NAME" \
  	--default-cwd "$SESSION_CWD"
}

bindkey -s ^f "sessionizer\n"
