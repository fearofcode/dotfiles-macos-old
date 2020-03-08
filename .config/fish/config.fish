set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH
set is_linux (uname | grep Linux)

if test -n "$is_linux"
    if status --is-login
        if test -z "$DISPLAY" -a $XDG_VTNR = 1
            exec startx -- -keeptty
        end
    end
end

if type -q uxterm
    export TERMINAL="uxterm"
end

export LESS='--quit-if-one-screen -R'

alias ls='exa'

# gives neat Ctrl-R history search widget, one of the few things I miss from bash
fzf_key_bindings


