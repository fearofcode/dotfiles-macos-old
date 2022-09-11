#!/bin/bash
set -euxo pipefail
echo "Xft.dpi: 192" | tee $HOME/.Xresources
echo "xrdb -merge ~/.Xresources" | tee $HOME/.xinitrc

# setup high dpi for login screen
STARTING_DIR=$(pwd)
sudo ln -sf $STARTING_DIR/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
