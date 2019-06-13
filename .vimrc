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

"Always show current position
set ruler
" A buffer becomes hidden when it is abandoned
set hidden

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
set textwidth=90
set wrap "Wrap lines
set laststatus=2

" Remap 0 to first non-blank character
map 0 ^

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set t_Co=256
    set guitablabel=%M\ %t
    set guicursor+=a:blinkon0
    set guifont=Hack\ 14
    autocmd GUIEnter * set vb t_vb=
endif

" Mac-specific font
if has("gui_macvim")
    set guifont=Hack-Regular:h18
endif

set background=dark

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
Plugin 'scrooloose/nerdtree'
" Plugin 'dracula/vim'
" Plugin 'Rigellute/shades-of-purple.vim'
" Plugin 'arcticicestudio/nord-vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'machakann/vim-highlightedyank'
Plugin 'airblade/vim-rooter'

" language stuff
Bundle 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

Plugin 'cespare/vim-toml'
Plugin 'plasticboy/vim-markdown'

Plugin 'vim-scripts/indentpython.vim'
Bundle "mgedmin/python-imports.vim"
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
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'vim-syntastic/syntastic'

Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'

call vundle#end()            " required
filetype plugin indent on    " required

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

let g:vim_isort_python_version = 'python3'
" let g:flake8_cmd=$HOME."/.local/bin/flake8"
let g:rustfmt_autosave = 1

let g:racer_cmd = $HOME."/.cargo/bin/racer"

" auto flake 8 on save
" autocmd BufWritePost *.py call flake8#Flake8()
" show flake 8 errors in the file
" let g:flake8_show_in_file=1

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:strip_whitespace_on_save = 1

" match editor theme
let g:airline_theme='jellybeans'

try
    colorscheme jellybeans
catch
endtry

" let g:shades_of_purple_airline = 1
" let g:airline_theme='shades_of_purple'

" let g:airline_theme='base16_nord'

" stops broken Unicode from showing up on arch
let g:airline_powerline_fonts = 1

" this will break if you have a different virtualenv setup than the one I use. sigh.
let g:virtualenv_directory = '.'
let g:virtualenv_auto_activate = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'node_modules/.bin/eslint'


" Use clangd for C autocomplete rather than libclang

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" if additional directories should be excluded for a specific project, you can filter git
" ls-files output like so and put it in .projectspecific.vim:
" let g:ctrlp_user_command = ['.git','git ls-files -co --exclude-standard | grep -v some_binary_directory | grep -v    something_else']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore

source $HOME/.projectspecific.vim

