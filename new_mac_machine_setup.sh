set -euxo pipefail

if [ "$(which brew)" == "" ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap homebrew/cask-fonts
brew cask install homebrew/cask-fonts/font-source-code-pro-nerd-font
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install curl fish git tmux tree macvim vifm less python httpie exa fzf mosh

STARTING_DIR=$(pwd)

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

cargo install ripgrep
cargo install tokei

touch $HOME/.projectspecific.vim

ln -sf $STARTING_DIR/.vimrc $HOME/.vimrc
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# make fish default shell
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

curl -L https://get.oh-my.fish | fish
# nice powerline theme https://github.com/oh-my-fish/theme-bobthefish
omf install bobthefish
