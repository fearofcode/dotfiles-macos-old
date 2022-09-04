set -euxo pipefail

sudo pacman -S dnsutils exa fd firefox fish fzf git gnu-free-fonts go httpie \
	kitty neovim noto-fonts openssh pipewire-alsa pipewire-pulse ripgrep \
	rofi tmux tokei tree unzip vifm wget whois

STARTING_DIR=$(pwd)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# make fish default shell
chsh -s /usr/bin/fish

mkdir -p ~/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/i3status/
mkdir -p $HOME/.config/kitty/
mkdir -p $HOME/.config/rofi/

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3status/config $HOME/.config/i3status/config
ln -sf $STARTING_DIR/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi 
