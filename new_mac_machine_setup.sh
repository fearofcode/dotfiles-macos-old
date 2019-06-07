set -x

if [ "$(which brew)" == "" ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew cask install alacritty
brew tap homebrew/cask-fonts
brew cask install font-hack
# intentionally not installing vim. macvim conflicts with vim and macvim is required for YouCompleteMe
brew install cmake curl fish fzf git tmux tree ctags macvim

echo "Installing Courier Prime Code..."
wget http://quoteunquoteapps.com/downloads/courier-code.zip -P ~/Downloads/
STARTING_DIR=$(pwd)
cd ~/Downloads
unzip ~/Downloads/courier-code.zip
cp ttf/* ~/Library/Fonts
cd $STARTING_DIR

if [ "$(which python3)" == "" ]; then
  echo "Installing Python..."
  brew install python3
fi

# install Rust
if [ "$(which cargo)" == "" ]; then
  echo "Installing Rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

source $HOME/.cargo/env

pip3 install yapf isort flake8

rustup toolchain add nightly
rustup default nightly
rustup component add rls rust-analysis rust-src

cargo install ripgrep
cargo install tokei
cargo install racer

# install jellybeans color theme (for regular vim)
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
cd $STARTING_DIR

mkdir -p $HOME/.config/fish/
mkdir -p $HOME/.config/alacritty/

if [ -e $HOME/.vimrc ]; then rm $HOME/.vimrc; fi
if [ -e $HOME/.tmux.conf ]; then rm $HOME/.tmux.conf; fi
ln -s $STARTING_DIR/.vimrc $HOME/.vimrc
ln -s $STARTING_DIR/.tmux.conf $HOME/.tmux.conf

ALACRITTY_CONFIG_PATH=$HOME/.config/alacritty/alacritty.yml
if [ -e $ALACRITTY_CONFIG_PATH ]; then rm $ALACRITTY_CONFIG_PATH; fi
ln -s $STARTING_DIR/alacritty.mac.yml $ALACRITTY_CONFIG_PATH

echo "set -gx PATH ~/.local/bin ~/.cargo/bin /usr/local/go/bin \$PATH" | tee -a ~/.config/fish/config.fish
if [ "$(which go)" == "" ]; then
  brew install go
  echo "export PATH=\$PATH:/usr/local/go/bin" | tee -a ~/.bashrc
  source ~/.bashrc
fi
go get -u golang.org/x/tools/cmd/gopls

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# add completers for rust, go, python
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --rust-completer --go-completer

# make fish default shell
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish
