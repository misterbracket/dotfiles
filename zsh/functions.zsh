# FUNCTIONS -------------------------------------------------------------------

# Create directory and cd into it
# Usage: take my-new-dir
take() {
  mkdir -p $1
  cd $1
}

# Monitor process memory usage (RSS) in real-time
# Usage: vmrss <process-id>
vmrss() {
    p=$1
    while true; do sync; ps -o rss= -p $1 | awk '{print $1/1024 " MB"}'; sleep 1; done
}

# Add directory to PATH if not already present
# Usage: addToPath /path/to/directory
# Note: Sometimes requires terminal restart to take effect
addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

# Kill Docker container by exposed port
# Usage: dkill 3000
dkill() {
    container_id=$(docker ps --format "{{.ID}}\t{{.Ports}}" | awk -F'\t' -v port="$1" '$2 ~ "->" port "/tcp" {print $1}')
     if [ -z "$container_id" ]; then
        echo "No container found with exposed port $1"
    else
        docker kill "$container_id"
        echo "Container $container_id killed"
    fi
}

# Launch tmux sessionizer (fuzzy finder for tmux sessions)
# Bound to Ctrl+f in keybindings.zsh
function tmux-sessionizer() {
  $DOTFILES/sessionizer/session.sh
}
