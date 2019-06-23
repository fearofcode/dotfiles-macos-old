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

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias ls='exa'

# gives neat Ctrl-R history search widget, one of the few things I miss from bash
fzf_key_bindings

# you know I had to do it to 'em
export FZF_DEFAULT_OPTS='
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

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

