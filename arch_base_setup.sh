# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo pacman -Syu xorg-server xorg-xinit xorg-xset i3-gaps i3status i3lock dmenu
# install a couple different terminals to play around with
sudo pacman -Syu xterm rxvt-unicode ttf-lato compton hsetroot

if [ ! -e "~/.xinitrc" ]; then
    echo "exec i3" >> ~/.xinitrc
fi

# install both dmneu and rofi since we might want to switch and they're small packages
sudo pacman -S rofi git openssh pulseaudio pulseaudio-alsa go

STARTING_DIR=$(pwd)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S compton.conf

# sorry
yay -S google-chrome

# why don't my old pulseaudio keybindings work with i3? whatever
yay -S pacmixer

# so we can set backgrond color with compton
yay -S hsetroot

# convenient fonts including the one we use in vim and the terminal
yay -S powerline-fonts-git

cd $STARTING_DIR

if lspci | grep NVIDIA; then
    echo "Installing NVIDIA drivers since they were detected"
    sudo pacman -S nvidia nvidia-settings
else
    echo "Not installing NVIDIA drivers since no NVIDIA hardware was detected"
fi

sudo pacman -S xdg-utils firefox fish python python-pip tmux tree whois dnsutils wget
sudo pacman -S vifm dnsutils gvim tokei ripgrep unzip gimp

# for working with Windows USB drives
sudo pacman -S ntfsprogs dosfstools exfat-utils

# make fish default shell
chsh -s /usr/bin/fish

pip3 install --user yapf isort flake8

mkdir -p ~/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/gtk-3.0/

touch $HOME/.projectspecific.vim

ln -sf $STARTING_DIR/.Xresources $HOME/.Xresources
ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/compton.conf $HOME/.config/compton.conf
ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3/.i3status.conf $HOME/.config/i3/.i3status.conf
ln -sf $STARTING_DIR/.config/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish

# copy so that we don't have symlinks from system directory into home directory
sudo cp $STARTING_DIR/scripts/remove_orphan_arch_packages /usr/local/bin/remove_orphan_arch_packages
sudo chown $(whoami) /usr/local/bin/remove_orphan_arch_packages

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# setup Yubico key support
cd /etc/udev/rules.d/
sudo wget https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-u2f.rules

# workaround for https://github.com/fish-shell/fish-shell/issues/5689
sudo wget "https://raw.githubusercontent.com/fish-shell/fish-shell/c6ec4235136e82c709e8d7b455f7c463f9714b48/share/completions/systemctl.fish" -O /usr/share/fish/completions/systemctl.fish

curl -L https://get.oh-my.fish | fish
# nice powerline theme https://github.com/oh-my-fish/theme-bobthefish
omf install bobthefish

# todo check if ntpd should be added here. does it fix the issue with dual booting clock
# changes by itself? do we need to add anything from timedatectl?

echo "Reboot if NVIDIA drivers were installed."
