#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'

PS1='[\u@\h \W]\$ '

# Kubernetes
alias kubectl=microk8s.kubectl
alias helm=microk8s.helm
alias k=microk8s.kubectl
source <(k completion bash | sed s/kubectl/k/g)

# Load aliases
source .bash_aliases
