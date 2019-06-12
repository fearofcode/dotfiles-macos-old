set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set is_linux (uname | grep Linux)
if begin test -n $is_linux; and status --is-login; end
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

if type -q alacritty
    export TERMINAL="alacritty"
end

export LESS='--quit-if-one-screen --HILITE-UNREAD --tabs=4 --no-init --window=-4'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

