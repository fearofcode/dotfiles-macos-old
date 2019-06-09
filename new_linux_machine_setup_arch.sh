# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo pacman -Syu xorg-server xorg-xinit xorg-xset i3-gaps i3status alacritty dmenu ttf-hack ttf-lato nvidia
sudo pacman -Syu git firefox fish rustup highlight ranger python python-chardet python-pip tmux tree whois dig
sudo pacman -Syu dnsutils go compton clang llvm gvim

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

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -sf $STARTING_DIR/i3config $HOME/.config/i3/config
ln -sf $STARTING_DIR/i3status.conf $HOME/.config/i3/.i3status.conf

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
