set -euxo pipefail

sudo pacman -S alacritty bat dnsutils exa fd firefox fish fzf git \
    gnu-free-fonts go httpie man-db neofetch neovim \
    noto-fonts openssh picom pipewire-alsa pipewire-pulse \
    redshift ripgrep rofi scrot tmux tokei tree unzip vifm \
    xorg-mkfontscale xorg-mkfontdir wget whois

# go language server
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/cosmtrek/air@latest

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.cargo/bin/rust-analyzer
chmod +x ~/.cargo/bin/rust-analyzer

STARTING_DIR=$(pwd)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# make fish default shell
chsh -s /usr/bin/fish

# kickass fzf integration with fish that is better than built-in fzf_key_bindings
yay -S fish-fzf

yay -S nerd-fonts-source-code-pro
yay -S ttf-iosevka-nerd
yay -S nerd-fonts-liberation-mono

mkdir -p $HOME/vim/colors/
mkdir -p $HOME/.config/nvim/lua/
mkdir -p $HOME/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/i3status/
mkdir -p $HOME/.config/alacritty/
mkdir -p $HOME/.config/rofi/

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.config/nvim/init.lua $HOME/.config/nvim/init.lua
cp -rs $STARTING_DIR/.config/nvim/ $HOME/.config/nvim/
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $STARTING_DIR/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3/picom.conf $HOME/.config/i3/picom.conf
ln -sf $STARTING_DIR/.config/i3status/config $HOME/.config/i3status/config
ln -sf $STARTING_DIR/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi 

sudo ln -sf $STARTING_DIR/scripts/dim_lights /usr/local/bin/dim_lights
sudo ln -sf $STARTING_DIR/scripts/lights_up /usr/local/bin/lights_up

# disable pc speaker
echo "xset -b" | tee $HOME/.xinitrc
