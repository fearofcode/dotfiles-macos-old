#!/bin/bash
set -euxo pipefail
echo "*.dpi: 192" | tee -a $HOME/.Xresources
echo "xrdb -merge ~/.Xresources" | tee -a $HOME/.xinitrc
# this will only work if the dotfiles repo is cloned to ~/dotfiles/
ln -sf ~/dotfiles/.config/i3/rofi_high_dpi.config ~/.config/i3/rofi.config

# setup high dpi for login screen
STARTING_DIR=$(pwd)
sudo ln -sf $STARTING_DIR/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
