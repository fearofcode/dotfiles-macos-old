set -euxo pipefail

sudo pacman -S bat dnsutils exa fd firefox fish fzf git \
    gnu-free-fonts go httpie kitty man-db neofetch neovim \
    noto-fonts openssh picom pipewire-alsa pipewire-pulse \
    redshift ripgrep rofi scrot tmux tokei tree unzip vifm \
    wget whois

# go language server
go install golang.org/x/tools/gopls@latest
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

mkdir -p $HOME/vim/colors/
mkdir -p $HOME/.config/nvim/lua/
mkdir -p $HOME/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/i3status/
mkdir -p $HOME/.config/kitty/
mkdir -p $HOME/.config/rofi/

wget https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim -P $HOME/.vim/colors

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $STARTING_DIR/.config/nvim/lua/config.lua $HOME/.config/nvim/lua/config.lua
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $STARTING_DIR/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3/picom.conf $HOME/.config/i3/picom.conf
ln -sf $STARTING_DIR/.config/i3status/config $HOME/.config/i3status/config
ln -sf $STARTING_DIR/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi 

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# install neovim plugins
nvim +PlugInstall

# disable pc speaker
echo "xset -b" | tee $HOME/.xinitrc
