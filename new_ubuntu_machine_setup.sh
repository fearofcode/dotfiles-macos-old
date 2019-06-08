# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-add-repository ppa:fish-shell/release-3 -y

sudo apt-get update

sudo apt install apt-file alacritty build-essential clang clang-tools cmake curl fish fonts-hack fonts-inconsolata fzf git htop i3 neofetch postgresql python3-dev python3-pip tmux tree universal-ctags vim vim-gtk whois xclip -y

# make fish default shell
chsh -s /usr/bin/fish

# install Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

pip3 install yapf isort flake8

rustup toolchain add nightly
rustup default nightly
rustup component add rls rust-analysis rust-src

# ripgrep is a fast grep replacement https://github.com/BurntSushi/ripgrep
cargo install ripgrep

# code lines counter
cargo install tokei

cargo install racer

# setup xclip to work like pbcopy/pbpaste for Mac
mkdir -p ~/.config/fish/
echo "alias pbcopy='xclip -selection clipboard'" | tee -a ~/.config/fish/config.fish
echo "alias pbpaste='xclip -selection clipboard -o'" | tee -a ~/.config/fish/config.fish

# install jellybeans color theme (for regular vim)
STARTING_DIR=$(pwd)
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
cd $STARTING_DIR

mkdir -p $HOME/.config/alacritty/
mkdir -p $HOME/.config/i3/
touch $HOME/.projectspecific.vim

if [ -e $HOME/.vimrc ]; then rm $HOME/.vimrc; fi
if [ -e $HOME/.tmux.conf ]; then rm $HOME/.tmux.conf; fi
ln -s $STARTING_DIR/.vimrc $HOME/.vimrc
ln -s $STARTING_DIR/.tmux.conf $HOME/.tmux.conf

ALACRITTY_CONFIG_PATH=$HOME/.config/alacritty/alacritty.yml
if [ -e $ALACRITTY_CONFIG_PATH ]; then rm $ALACRITTY_CONFIG_PATH; fi
ln -s $STARTING_DIR/alacritty.yml $ALACRITTY_CONFIG_PATH

I3_CONFIG_PATH=$HOME/.config/i3/config
if [ -e $I3_CONFIG_PATH ]; then rm $I3_CONFIG_PATH; fi
ln -s $STARTING_DIR/i3config $I3_CONFIG_PATH

I3_STATUS_PATH=$HOME/.config/i3/.i3status.conf
if [ -e $I3_STATUS_PATH ]; then rm $I3_STATUS_PATH; fi
ln -s $STARTING_DIR/i3status.conf $I3_STATUS_PATH

# install go
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz -P ~/Downloads/
sudo tar -C /usr/local -xzf ~/Downloads/go1.12.5.linux-amd64.tar.gz
echo "set -gx PATH ~/.local/bin ~/.cargo/bin /usr/local/go/bin \$PATH" | tee -a ~/.config/fish/config.fish
echo "export PATH=\$PATH:/usr/local/go/bin" | tee -a ~/.bashrc
source ~/.bashrc
go get -u golang.org/x/tools/cmd/gopls

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# add completers for rust, go, python
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --rust-completer --go-completer

# increase typematic rate, decrease delay
#https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration#Adjusting_typematic_delay_and_rate
xset r rate 200 40
# set it for virtual console as well
sudo kbdrate -d 200 -r 40

echo "Install and configure Dropbox, then reboot. The i3 config will start Dropbox."
