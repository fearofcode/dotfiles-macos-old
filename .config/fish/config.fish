set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

set is_linux (uname | grep Linux)

if test -n "$is_linux"
    if status --is-login
        if test -z "$DISPLAY" -a $XDG_VTNR = 1
            exec startx -- -keeptty
        end
    end
end

if type -q alacritty
    export TERMINAL="alacritty"
end

export LESS='--quit-if-one-screen --HILITE-UNREAD --tabs=4 --no-init --window=-4'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

### BEGIN: AUTOVENV
### Automatically activate a virtualenv stored in sub-directory called "venv"

set git_root (git rev-parse --show-toplevel 2>&1)

if test $status -eq 0
    set activate_path "$git_root/venv/bin/activate.fish"

    if test -e $activate_path
        source $activate_path && export CD_VIRTUAL_ENV_ROOT=$git_root
    end
else if test -n "$CD_VIRTUAL_ENV_ROOT"
    deactivate && unset CD_VIRTUAL_ENV_ROOT
end

### END: AUTOVENV

