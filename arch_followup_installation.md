These instructions are specific to my preferences and hardware!

- `useradd -m -g wheel <your username>`
- `passwd <your username>`
- Edit `/etc/sudoers`
- Install Xorg: `pacman -S xorg-server xorg-xinit xorg-xset`
- Install i3-gaps and alacritty: `pacman -S i3-gaps i3status alacritty dmenu`
- Install some fonts: `pacman -S ttf-hack ttf-lato`
- Update `~/.xinitrc` to start i3: add `exec i3`
- Install Nvidia drivers (I have nvidia drivers): `pacman -S nvidia`
- Start X: `startx`
