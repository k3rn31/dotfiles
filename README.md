# k3rn31’s Dotfiles

_**Note that these dotfiles work for me and may not work for you. Also, I move things around a lot and breaking changes may occur quite often.**_

This is my personal _.dotfiles_ repostory. At the moment I use ArchLinux with _i3_ and _i3blocks_ as my WM.  I usually do some ricing for aesthetic purposes, but always as an aside to usabilty and productivity.

My main terminal is [st](https://st.suckless.org/), which is configured at compile time. This repository has a submodule pointing to my own [PKGBUILD](https://github.com/k3rn31/st), used to build and install my own flavour of *st*.

My Emacs setup is also included in the repository. The [configuration](.emacs.d/configuration.org) is done in _literate programming_ style. I use _Evil Mode_, don't use it if you don't like modal editing. Again, this is my personal setup and is not supposed to be used by other people (but you are free to use it if you like).

## Setup

Running `./setup.sh` will prompt with a menu showing different options to put dotfiles in place. The configuration is done mostly by symlinking files and folders from _.dotfiles_.
