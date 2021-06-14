# k3rn31’s Dotfiles

_**Note that these dotfiles work for me and may not work for you. Also, I move
things around a lot and breaking changes may occur quite often. Don't just
run the setup script or it will end up to a mess. If you want, cherrypick what
you need.**_

This is my personal _.dotfiles_ repository. I usually do some ricing for fun,
but always with usability in mind.
My main setup:

- ArchLinux
- i3 / i3blocks / dmenu / dunst
- NeoVim
- tmux

## (N)Vim
I mainly use NeoVim as my daily workhorse. I use a setup with support for Go and
Rust programming. I betray Vim for IntelliJ IDEA only for Java programming. The
setup should work for both Vim and NeoVim.

I recently switched my terminal to from St to
[Alacritty](https://github.com/alacritty/alacritty). I was simply tired of
doing merges and fighting with patches every time there was an upgrade.
Besides, I lie Rust...

## Emacs
My Emacs setup is also included in the repository, even if I don't use it much
(I'm more a Vi guy). The [configuration](.emacs.d/configuration.org) is done in
_literate programming_ style. I use _Evil Mode_, don't use it if you don't like
modal editing. Again, this is my personal setup and is not supposed to be used
by other people (but you are free to use it if you like).

## Setup
Running `./setup.sh` will prompt with a menu showing different options to put
dotfiles in place. The configuration is done mostly by symlinking files and
folders from _.dotfiles_.
