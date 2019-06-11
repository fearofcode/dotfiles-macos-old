set PATH $HOME/.cargo/bin $PATH

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

if type -q alacritty
    export TERMINAL="alacritty"
end

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

