#!/bin/bash

# ncurses is because it's required for cuda-gdb according to the wiki apparently
# it's a 4 year old bug that no one has done anything about
# i love computers
# https://bugs.archlinux.org/task/46598
# java is so we can run nsight. how exciting!
sudo pacman -S cuda cuda-gdb ncurses5-compat-libs jre8-openjdk

echo "Logout/reboot if there was a message that you needed to do that."
