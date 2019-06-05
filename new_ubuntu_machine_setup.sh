# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update

sudo apt install \
    # for searching for what packages contain things like include files
    apt-file \
    # fast, GPU-accelerated terminal
    alacritty \
    clang \
    # needed for exa
    cmake \
    curl \
    exuberant-ctags \
    # nice alternative shell
    fish \
    # some fonts
    fonts-hack \
    htop \
    git \
    neovim \
    postgresql \
    python3-dev \
    python-dev \
    tmux \
    tree \
    vim \
    vim-gtk \
    whois \
    xclip \
    # why not just use Xubuntu? because their ISOs always freeze up on me, IDK
    xfce4 \
    xubuntu-desktop -y

# make fish default shell
chsh -s /usr/bin/fish

# install Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# ripgrep is a fast grep replacement https://github.com/BurntSushi/ripgrep
cargo install ripgrep

# code lines counter
cargo install tokei

# setup xclip to work like pbcopy/pbpaste for Mac
mkdir -p ~/.config/fish/
echo "alias pbcopy='xclip -selection clipboard'" | tee -a ~/.config/fish/config.fish
echo "alias pbpaste='xclip -selection clipboard -o'" | tee -a ~/.config/fish/config.fish
echo "source $HOME/.cargo/env" | tee -a ~/.config/fish/config.fish

# install jellybeans color theme (for regular go)
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# install ctrlp
cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

cp .vimrc ~
cp .tmux.conf ~
cp alacritty.yml $HOME/.config/alacritty/alacritty.yml

# install go
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz
echo "set -gx PATH /usr/local/go/bin $PATH" | tee -a ~/.config/fish/config.fish
echo "export PATH=$PATH:/usr/local/go/bin" | tee -a ~/.bashrc

echo "Manual steps to perform:"
echo " * Install Dropbox" # can technically be automated but whatever
echo " * Get SSH keys from Dropbox"
echo " * Run :GoInstallBinaries in vim (not neovim)"

