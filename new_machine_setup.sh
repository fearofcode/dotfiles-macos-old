# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-add-repository ppa:fish-shell/release-3 -y

sudo apt-get update

sudo apt install \
    alacritty \
    clang \
    curl \
    fish \
    fonts-hack \
    fonts-inconsolata \
    fonts-ricty-diminished \
    git \
    llvm \
    postgresql \
    python3-dev \
    python-dev \
    tmux \
    tree \
    vim \
    vim-gtk \
    whois \
    xclip -y

# make fish default shell
chsh -s /usr/bin/fish

# install Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

cargo install ripgrep

# setup xclip to work like pbcopy/pbpaste for Mac
mkdir -p ~/.config/fish/
echo "alias pbcopy='xclip -selection clipboard'" | tee -a ~/.config/fish/config.fish
echo "alias pbpaste='xclip -selection clipboard -o'" | tee -a ~/.config/fish/config.fish
echo "source $HOME/.cargo/env" | tee -a ~/.config/fish/config.fish

# install jellybeans color theme
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# install ctrlp
cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

cp .vimrc ~/.vimrc

cp alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo "Manual steps to perform:"
echo " * Install Dropbox" # can technically be automated but whatever
echo " * Get SSH keys from Dropbox"
