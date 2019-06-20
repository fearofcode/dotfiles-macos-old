set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH
# disable prompt since we are using bob the fish that displays this for us
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
# as per https://github.com/oh-my-fish/theme-bobthefish#installation
set -g theme_nerd_fonts yes

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

export LESS='--quit-if-one-screen -R'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# https://github.com/Peltoche/lsd
alias ls='lsd'

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

