syntax on
let mapleader = ','

" make splits nicer
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap 0 to first non-blank character
map 0 ^

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

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set t_Co=256
    set guitablabel=%M\ %t
    set guicursor+=a:blinkon0
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Semi-bold\ 14
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

" generic stuff
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'machakann/vim-highlightedyank'
Plugin 'airblade/vim-rooter'

Plugin 'cespare/vim-toml'
Plugin 'plasticboy/vim-markdown'

Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

let g:strip_whitespace_on_save = 1

let g:airline_theme='onedark'

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
try
    colorscheme onedark
catch
endtry

" make the color scheme not look like shit in terminal

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" stops broken Unicode from showing up on arch
let g:airline_powerline_fonts = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" if additional directories should be excluded for a specific project, you can filter git
" ls-files output like so and put it in .projectspecific.vim:
" let g:ctrlp_user_command = ['.git','git ls-files -co --exclude-standard | grep -v some_binary_directory | grep -v    something_else']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore

source $HOME/.projectspecific.vim

