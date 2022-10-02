set PATH $HOME/.cargo/bin $HOME/go/bin $HOME/.local/bin $PATH
export LESS='--quit-if-one-screen -R'

alias ls='exa'
alias cat='bat'
alias vim='nvim'

# https://github.com/sharkdp/bat#customization
# kind of the closest that matches with our Alabaster theme
export BAT_THEME="1337"

# https://starship.rs/
starship init fish | source
