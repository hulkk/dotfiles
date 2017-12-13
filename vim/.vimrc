" encoding must be set at first line or not at all
set encoding=utf-8

" vim-plug section begins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'    " lightline
Plug 'sheerun/vim-polyglot'     " syntax highlighting
Plug 'Yggdroot/indentLine'      " indent guides
Plug 'airblade/vim-gitgutter'   " git diff utility
Plug 'pearofducks/ansible-vim'  " ansible syntax plugin

call plug#end()
" vim-plug section ends

" Plug automatically executes following commands 
" filetype plugin indent on
" syntax enable

" set ansible inventory filetype
autocmd BufRead,BufNewFile */environments/*/inventory* set filetype=ansible

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" always show sign column
set signcolumn=yes

" fix commented text
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" use spaces instead of tabs
set expandtab

" indent/outdent 4 spaces at a time
set shiftwidth=4

" show cursorline
set cursorline

" indent guide character
let g:indentLine_char = ':'

" color configurations
set background=dark
colorscheme solarized8_high

" disable duplicate mode info
set noshowmode

" show line numbers
set number

" always show status line
set laststatus=2

" status bar height
set cmdheight=1

" start searching when typing
set incsearch

" highlight all search results
set hlsearch

" ignore letter case when searching
set ignorecase

" except when search contains uppercase letters
set smartcase

" fix backspace in insert mode
set backspace=2

" indent by 2 spaces when using tab
set softtabstop=2

" enable true colors support
set termguicolors

" disable swp file
set noswapfile

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" start scrolling earlier
set scrolloff=3

" faster update frequency for git gutter
set updatetime=250
