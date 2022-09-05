set -euxo pipefail

sudo pacman -S bat dnsutils exa fd firefox fish fzf git gnu-free-fonts go httpie \
	kitty neofetch neovim noto-fonts openssh pipewire-alsa pipewire-pulse ripgrep \
	rofi scrot tmux tokei tree unzip vifm wget whois

go install golang.org/x/tools/gopls@latest

STARTING_DIR=$(pwd)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# make fish default shell
chsh -s /usr/bin/fish

# kickass fzf integration with fish that is better than built-in fzf_key_bindings
yay -S fish-fzf

mkdir -p ~/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/i3status/
mkdir -p $HOME/.config/kitty/
mkdir -p $HOME/.config/rofi/

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $STARTING_DIR/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3status/config $HOME/.config/i3status/config
ln -sf $STARTING_DIR/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi 
