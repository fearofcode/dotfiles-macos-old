set -euxo pipefail

sudo pacman -S alacritty bat clang dnsutils exa fd firefox fish fzf git \
    gnu-free-fonts go httpie imagemagick lldb man-db neofetch neovim \
    noto-fonts noto-fonts-emoji nvidia-settings openssh picom pipewire-alsa pipewire-pulse \
    redshift ripgrep rofi scrot tmux tokei tree unzip vifm \
    xorg-mkfontscale xorg-mkfontdir xorg-set wget whois

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# kickass fzf integration with fish that is better than built-in fzf_key_bindings
yay -S fish-fzf

yay -S nerd-fonts-source-code-pro
yay -S ttf-iosevka-nerd
yay -S nerd-fonts-liberation-mono

STARTING_DIR=$(pwd)

mkdir -p $HOME/vim/colors/
mkdir -p $HOME/.config/nvim/lua/
mkdir -p $HOME/.config/fish/
mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/i3status/
mkdir -p $HOME/.config/alacritty/
mkdir -p $HOME/.config/rofi/

# arch specific dot files
ln -sf $STARTING_DIR/.config/i3/rofi_regular.config ~/.config/i3/rofi_regular.config
# default to low DPI
ln -sf $STARTING_DIR/.config/i3/rofi_regular.config ~/.config/i3/rofi.config
ln -sf $STARTING_DIR/.config/i3/rofi_high_dpi.config ~/.config/i3/rofi_high_dpi.config

ln -sf $STARTING_DIR/.config/i3/config $HOME/.config/i3/config
ln -sf $STARTING_DIR/.config/i3/picom.conf $HOME/.config/i3/picom.conf
ln -sf $STARTING_DIR/.config/i3status/config $HOME/.config/i3status/config
ln -sf $STARTING_DIR/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi 


sudo ln -sf $STARTING_DIR/scripts/dim_lights /usr/local/bin/dim_lights
sudo ln -sf $STARTING_DIR/scripts/lights_up /usr/local/bin/lights_up
