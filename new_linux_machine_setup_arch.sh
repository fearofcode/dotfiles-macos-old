# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo pacman -Syu xorg-server xorg-xinit xorg-xset i3-gaps i3status i3lock dmenu
# install a couple different terminals to play around with
sudo pacman -Syu xterm rxvt-unicode

if [ ! -e "~/.xinitrc" ]; then
    echo "exec i3" >> ~/.xinitrc
fi

# install both dmneu and rofi since we might want to switch and they're small packages
sudo pacman -S rofi git openssh pulseaudio pulseaudio-alsa

STARTING_DIR=$(pwd)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# sorry
yay -S google-chrome

# why don't my old pulseaudio keybindings work with i3? whatever
yay -S pacmixer

# so we can set backgrond color with compton
yay -S hsetroot

# font used in most places
yay -S dina-font

cd $STARTING_DIR

if lspci | grep NVIDIA; then
    echo "Installing NVIDIA drivers since they were detected"
    sudo pacman -S nvidia nvidia-settings
else
    echo "Not installing NVIDIA drivers since no NVIDIA hardware was detected"
fi

sudo pacman -S xdg-utils firefox fish rustup python python-pip tmux tree whois dig wget
sudo pacman -S vifm dnsutils go compton clang llvm gvim scrot gimp
# for watching videos ~ O F F L I N E ~
sudo pacman -S ffmpeg youtube-dl vlc

# make fish default shell
chsh -s /usr/bin/fish

pip3 install yapf isort flake8

rustup update
rustup toolchain add nightly
rustup default nightly
rustup component add rls rust-analysis rust-src

# ripgrep is a fast grep replacement https://github.com/BurntSushi/ripgrep
cargo install ripgrep

# code lines counter
cargo install tokei

cargo install racer

go get -u golang.org/x/tools/cmd/gopls

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

# install jellybeans color theme (for regular vim)
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# add completers for rust, go, python
cd ~/.vim/bundle/YouCompleteMe
# using clangd rather than default libclang
python3 install.py --clangd-completer --rust-completer --go-completer

sudo su - postgres
initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
exit
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo su - postgres

# this is for my personal projects, feel free to remove
createdb arete
createdb arete_test

echo "Reboot if NVIDIA drivers were installed."
