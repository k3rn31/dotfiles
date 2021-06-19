#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Load aliases
# shellcheck source=.bash_aliases
source ~/.bash_aliases

export EDITOR=nvim

export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Initialize Starship
eval "$(starship init bash)"

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
# Try this to fuzzy-search through all available packages, with package info
# shown in a preview window, and then install selected packages
alias pacfzf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"

