#!/bin/sh

# Restore Wallpaper
nitrogen --restore
wal -R

# Start Compton
picom &

# Start notification daemon
dunst &

# Start auto-mounter
udiskie --tray &

# Start Dropbox
dropbox &

# Start unclutter to hide mouse cursor
unclutter &

# Jetbrains Toolbox
/usr/bin/jetbrains-toolbox --minimize &

# Start applets
/usr/bin/blueman-applet	# Bluetooth Manager
