#!/bin/bash

echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (1) Setup Emacs symlinks \u001b[0m"
echo -e "  \u001b[34;1m (2) Setup symlinks \u001b[0m"
echo -e "  \u001b[31;1m (0) Exit \u001b[0m"


echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

# Emacs setup
"1")echo -e "\u001b[7m Setting up Emacs symlinks... \u001b[0m"
    echo -e "\u001b[33;1m Backup existing files? (y/n) \u001b[0m"
    read -r backupOption

    if [[ $backupOption == "y" ]]; then
        echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
        mv -v ~/.emacs.d ~/.emacs.d.old
    else
        echo -e "\u001b[36;1m Skipping backups. \u001b[0m"
    fi

    echo -e "\u001b[36;1m Adding symlinks...\u001b[0m"
    ln -sfnv "$PWD/.emacs.d" ~/.emacs.d
    ;;

# All other symlinks setup
"2")echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    echo -e "\u001b[33;1m Backup existing files? (y/n) \u001b[0m"
    read -r backupOption

    if [[ $backupOption == "y" ]]; then
        echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
	mv -iv ~/.bashrc ~/.bashrc.old
	mv -iv ~/.bash_aliases ~/.bash_aliases.old
	mv -iv ~/.xprofile ~/.xprofile.old
	mv -iv ~/.scripts ~/.scripts.old
	mv -iv ~/.config/dunst ~/.config/dunst.old
	mv -iv ~/.config/i3 ~/.config/i3.old
	mv -iv ~/.config/i3blocks ~/.config/i3blocks.old
	mv -iv ~/.config/picom ~/.config/picom.old
	mv -iv ~/.config/qutebrowser ~/.config/qutebrowser.old
	mv -iv ~/.config/zathura ~/.config/zathura.old
	mv -iv ~/.config/alacritty ~/.config/ideavimrc.old
	mv -iv ~/.weechat ~/.weechat.old
	mv -iv ~/.ideavimrc ~/.ideavimrc.old
    else
        echo -e "\u001b[36;1m Skipping backups. \u001b[0m"
    fi

    ln -sfnv "$PWD/.bashrc" ~/.bashrc
    ln -sfnv "$PWD/.bash_aliases" ~/.bash_aliases
    ln -sfnv "$PWD/.xprofile" ~/.xprofile
    ln -sfnv "$PWD/scripts" ~/.scripts
    ln -sfnv "$PWD/config/dunst" ~/.config/dunst
    ln -sfnv "$PWD/config/i3" ~/.config/i3
    ln -sfnv "$PWD/config/i3blocks" ~/.config/i3blocks
    ln -sfnv "$PWD/config/picom" ~/.config/picom
    ln -sfnv "$PWD/config/qutebrowser" ~/.config/qutebrowser
    ln -sfnv "$PWD/config/zathura" ~/.config/zathura
    ln -sfnv "$PWD/config/alacritty" ~/.config/alacritty
    ln -sfnv "$PWD/weechat" ~/.weechat
    ln -sfnv "$PWD/.ideavimrc" ~/.ideavimrc
    ;;

"0")echo -e "\u001b[32;1m Bye! \u001b[0m"
    exit 0
    ;;

*)echo -e "\u001b[31;1m Invalid option entered! \u001b[0m"
    exit 1
    ;;

esac

exit 0
