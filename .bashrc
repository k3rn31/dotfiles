#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='nvim'

PS1='[\u@\h \W]\$ '

# Load aliases
source ~/.bash_aliases

export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

eval "$(starship init bash)"
