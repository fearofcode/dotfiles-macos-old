set -euxo pipefail

mkdir -p $HOME/.config/nvim/lua/
mkdir -p $HOME/.config/fish/
mkdir -p $HOME/.config/alacritty/

STARTING_DIR=$(pwd)

ln -sf $STARTING_DIR/.config/nvim/init.lua $HOME/.config/nvim/init.lua
cp -rs $STARTING_DIR/.config/nvim/ $HOME/.config/nvim/
ln -sf $STARTING_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $STARTING_DIR/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $STARTING_DIR/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
