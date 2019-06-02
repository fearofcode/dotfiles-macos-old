# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo apt install clang \
    curl \
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
    xclip

# install Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

cargo install ripgrep
cargo install lsd

# setup xclip to work like pbcopy/pbpaste for Mac
echo "alias pbcopy='xclip -selection clipboard'" | tee -a ~/.bashrc
echo "alias pbpaste='xclip -selection clipboard -o'" | tee -a ~/.bashrc
echo "alias ls='lsd'" | tee -a ~/.bashrc

# install jellybeans color theme
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# install ctrlp
cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

cp .vimrc ~/.vimrc

echo "Manual steps to perform:"
echo " * Install Dropbox" # can technically be automated but whatever
echo " * Get SSH keys from Dropbox"
echo " * Install patched fonts for LSD at <https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts>"
