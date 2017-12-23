filetype plugin indent on
set relativenumber
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set laststatus=2
execute pathogen#infect()
map <C-n> :NERDTreeToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
