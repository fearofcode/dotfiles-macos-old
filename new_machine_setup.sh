# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo apt install clang \
    curl \
    dropbox \
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

echo "alias pbcopy='xclip -selection clipboard'" | tee -a ~/.bashrc
echo "alias pbpaste='xclip -selection clipboard -o'" | tee -a ~/.bashrc

