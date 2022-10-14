set -U fish_greeting

set PATH /opt/homebrew/opt/llvm/bin/ /opt/homebrew/opt/gnu-sed/libexec/gnubin $HOME/.cargo/bin $HOME/go/bin $HOME/.local/bin $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export LESS='--quit-if-one-screen -R'

alias ls='exa'
alias cat='bat'
alias vim='nvim'

# https://github.com/sharkdp/bat#customization
# kind of the closest that matches with our Alabaster theme
export BAT_THEME="1337"

# https://starship.rs/
starship init fish | source
