" Enable filetype plugins
filetype plugin on
filetype indent on

set number

set fileformat=unix
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler
" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase
" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set textwidth=120
set wrap "Wrap lines
set laststatus=2

" Remap VIM 0 to first non-blank character
map 0 ^

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    color jellybeans
catch
endtry

set background=dark

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set t_Co=256
    set guitablabel=%M\ %t
    set guicursor+=a:blinkon0
    set guifont=Hack\ 16
endif

" Properly disable sound on errors on MacVim and set Mac-specific font
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
    set guifont=Hack-Regular:h18
endif

" plugin stuff

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add plugins here
" not using syntastic because it's not super helpful and conflicts with flake8
" see https://github.com/vim-syntastic/syntastic/issues/1924

" generic stuff
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'machakann/vim-highlightedyank'
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf'

" language stuff
Bundle 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

Plugin 'cespare/vim-toml'
Plugin 'plasticboy/vim-markdown'

Plugin 'vim-scripts/indentpython.vim'
Bundle "mgedmin/python-imports.vim"
Plugin 'nvie/vim-flake8'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'fisadev/vim-isort'
Plugin 'raimon49/requirements.txt.vim', {'for': 'requirements'}

Plugin 'fatih/vim-go', {'do': ':GoInstallBinaries'}


Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'racer-rust/vim-racer'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'HerringtonDarkholme/yats.vim'

Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'

call vundle#end()            " required
filetype plugin indent on    " required

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'rls',
                \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
                \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
                \ 'whitelist': ['rust'],
                \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
                \ 'whitelist': ['go'],
                \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

"python with virtualenv support
"python3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let g:vim_isort_python_version = 'python3'
let g:flake8_cmd=$HOME."/.local/bin/flake8"
let g:rustfmt_autosave = 1

let g:racer_cmd = $HOME."/.cargo/bin/racer"

" auto flake 8 on save
autocmd BufWritePost *.py call flake8#Flake8()
" show flake 8 errors in the file
let g:flake8_show_in_file=1

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:strip_whitespace_on_save = 1

" match editor theme
let g:airline_theme='jellybeans'

" this will break if you have a different virtualenv setup than the one I use. sigh.
let g:virtualenv_directory = '.'
let g:virtualenv_auto_activate = 1
