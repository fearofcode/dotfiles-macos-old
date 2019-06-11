# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo add-apt-repository ppa:jasonpleau/rofi

sudo apt-get update

sudo apt install apt-file alacritty build-essential clang clang-tools cmake curl fish
sudo apt install fonts-hack git htop i3 neofetch postgresql
sudo apt install python3-dev python3-pip ranger rofi tmux tree universal-ctags unrar vim vim-gtk whois xclip -y

