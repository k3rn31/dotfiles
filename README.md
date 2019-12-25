# Dotfiles

_**Note that these dotfiles work for me and may not work for
you. Also, I move things around a lot and breaking changes may occur
quite often.**_

This is my personal _.dotfiles_ repostory. At the moment I
use ArchLinux with _i3_ and _i3blocks_ as my WM.  I usually do some
ricing for aesthetic purposes, but always as an aside to usabilty and
productivity.

My main terminal is [st](https://st.suckless.org/), which is
configured at compile time. In this repository there is the `config.h`
file, but it isn't really a dotfile since it is not read at runtime. I
maintain my own PKGBUILD to configure, build and install my own
flavour of *st*.

The dotfiles also include my Emacs setup. The configuration is done in
_literate programming_ style, and the setup uses _Evil Mode_, don't
use it if you don't like modal editing. Again, this is my personal
setup.


## Setup

Running `./setup.sh` will prompt with a menu showing different options
to put dotfiles in place. The configuration is done mostly by
symlinking files and folders form _.dotfiles_.
