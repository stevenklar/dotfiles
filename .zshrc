source $HOME/dotfiles/zsh/rc

[ -f $HOME/Code/dockerfiles/generated_bin ] && source $HOME/Code/dockerfiles/generated_bin
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f "$(which setxkbmap)" ] && setxkbmap -layout 'de,us'

