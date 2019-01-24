# oh my zsh path
include () {
    [[ -f "$1" ]] && source "$1"
}

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"
[[ -f "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme" ]] && ZSH_THEME="spaceship"

# load own bash stuff
include $HOME/.secret

# exports
## Custom exports
export LANG=de_DE.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"
export EDITOR='nvim'
export ZSH=$HOME/.oh-my-zsh
export ZSH_CACHE_DIR=/tmp

# override path
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:/usr/local/go/bin

# aliases
# Editor
v() {
    if hash nvim 2>/dev/null; then
        nvim "$@"
    else
        vim "$@"
    fi
}

alias k="kubectl"
alias h="helm"
alias c="clear"

# Configurations
alias zshrc="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias dot="nvim ~/dotfiles"
alias config="nvim ~/.config"

# little day helper
alias copy="xsel -i -b"
alias x="exit"

# task
alias t="clear && task"
alias ti="clear && task project:inbox"
alias tw="clear && task +work"

# Docker
alias dc="docker-compose"
alias dm="docker-machine"
alias dst="docker stack"
alias dse="docker service"
alias dcl="docker container ls"
# de -u (switch back to local machine)
alias de='_docker_env() { eval $(docker-machine env $1) ;}; _docker_env'

alias config='/usr/bin/git --git-dir=$HOME/.store/ --work-tree=$HOME'

# plugins
plugins=(git docker tig bash-completion zsh-completion)

# load oh-my-zsh
include $HOME/.oh-my-zsh/oh-my-zsh.sh
[ -f "$(which tmuxinator)" ] && include $HOME/.config/tmuxinator/tmuxinator.zsh

# load auto completions
[ -f "$(which kubectl)" ] && source <(kubectl completion zsh)
#[ -f "$(which helm)" ] && source <(helm completion zsh)
[ -f "$(which kompose)" ] && source <(kompose completion zsh)

# Makefile completion
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make::' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:descriptions' format '%B%d%b'

[ -f $HOME/Code/dockerfiles/generated_bin ] && source $HOME/Code/dockerfiles/generated_bin
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f "$(which setxkbmap)" ] && setxkbmap -layout 'de,us'

