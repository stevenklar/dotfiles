# dotfiles
My ~ files. These work on the following distros out of the box:

* Linux Mint
* ArchLinux

## Requirements

* git

## Install

> Stay in the same terminal all the time and run the following commands:

```bash
# Checkout bare dotfiles repository into $HOME/.store
git clone --bare git@github.com:stevenklar/dotfiles.git $HOME/.store

# Setup temporary alias
alias config='/usr/bin/git --git-dir=$HOME/.store/ --work-tree=$HOME'

# Ignore untracked files
config config --local status.showUntrackedFiles no

# Check if you ovverride existing files (continue if all files are marked deleted or you are sure to overwrite whatever)
config status

# Install all files (ATTENTION, 
config checkout .
```



