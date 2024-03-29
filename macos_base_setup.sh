#! /bin/bash
set -euxo pipefail

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/wkh/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/wkh/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask alacritty
brew install bat
brew install --cask emacs
brew install exa
brew install fd
brew install fish
brew install fzf
brew install go
brew install htop
brew install httpie
brew install java
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install llvm # this won't get linked. we just want the lldb-vscode binary without dealing with 50 goddamn malware warnings
brew install neovim
brew install ripgrep
brew install tmux
brew install tokei
brew install tree
brew install vifm
brew install wget

# so that chsh fish will work
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish

sudo mkdir -p -m 775 /usr/local/bin

brew tap epk/epk
brew install --cask font-sf-mono-nerd-font

# need this to easily install fish-fzf
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
