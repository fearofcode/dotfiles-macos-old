#!/bin/bash
set -euxo pipefail
echo "Xft.dpi: 192" | tee $HOME/.Xresources
echo "xrdb -merge ~/.Xresources" | tee $HOME/.xinitrc
