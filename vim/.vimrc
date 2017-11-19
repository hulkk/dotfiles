" vim-plug section begins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'  " lightline
Plug 'sheerun/vim-polyglot'   " syntax highlighting
Plug 'Yggdroot/indentLine'    " indent guides
Plug 'airblade/vim-gitgutter' " git diff utility

call plug#end()
" vim-plug section ends

" Plug automatically executes following commands 
" filetype plugin indent on
" syntax enable

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

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
