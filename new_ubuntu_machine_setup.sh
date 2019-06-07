# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-add-repository ppa:fish-shell/release-3 -y

sudo apt-get update

sudo apt install apt-file alacritty build-essential clang clang-tools cmake curl fish fzf git htop i3 postgresql python3-dev python3-pip tmux tree universal-ctags vim vim-gtk whois xclip -y

# make fish default shell
sudo chsh -s /usr/bin/fish

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
echo "source $HOME/.cargo/env" | tee -a ~/.config/fish/config.fish

# install jellybeans color theme (for regular go)
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

cp .vimrc ~
cp .tmux.conf ~
cp alacritty.yml $HOME/.config/alacritty/alacritty.yml

# install go
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz
echo "set -gx PATH ~/.local/bin /usr/local/go/bin $PATH" | tee -a ~/.config/fish/config.fish
echo "export PATH=$PATH:/usr/local/go/bin" | tee -a ~/.bashrc
source ~/.bashrc
go get -u golang.org/x/tools/cmd/gopls

# we also have to install Vundle because we live in a cruel, remorseless world devoid of hope
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# add completers for rust, go, python
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --rust-completer --go-completer

