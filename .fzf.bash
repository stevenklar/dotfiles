# Setup fzf
# ---------
if [[ ! "$PATH" == */home/skdo/.fzf/bin* ]]; then
  export PATH="$PATH:/home/skdo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/skdo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/skdo/.fzf/shell/key-bindings.bash"

