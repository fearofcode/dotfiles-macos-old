filetype plugin indent on
syntax on
set number
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=120
set t_Co=256 "use 256 colors
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guicursor+=a:blinkon0
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set guifont=Inconsolata\ Medium\ 18

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
