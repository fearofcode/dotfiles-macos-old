#! /bin/bash
set -euxo pipefail

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/wkh/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/wkh/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask alacritty
brew install bat
brew install exa
brew install fd
brew install fish
brew install fzf
brew install go
brew install httpie
brew install neovim
brew install ripgrep
brew install tmux
brew install tokei
brew install tree
brew install vifm
brew install wget
