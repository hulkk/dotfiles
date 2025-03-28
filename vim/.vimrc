" encoding must be set at first line or not at all
set encoding=utf-8

" vim-plug section begins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'vim-airline/vim-airline'             " vim-airline
Plug 'sheerun/vim-polyglot'                " syntax highlighting
Plug 'lukas-reineke/indent-blankline.nvim' " indent-blankline 
Plug 'itchyny/lightline.vim'               " lightline
Plug 'airblade/vim-gitgutter'              " git diff utility
Plug 'pearofducks/ansible-vim'             " ansible syntax plugin
Plug 'morhetz/gruvbox'                     " gruvbox vim theme
Plug 'luochen1990/rainbow'                 " colorize nested parentheses
Plug 'dense-analysis/ale'                  " asynchronous lint engine

call plug#end()
" vim-plug section ends

" Plug automatically executes following commands 
" filetype plugin indent on
" syntax enable

" set ansible inventory filetype
autocmd BufRead,BufNewFile */environments/*/inventory* set filetype=ansible

" lightline settings
let g:lightline = {
    \ 'colorscheme': 'gruvbox'
\ }

let g:lightline.separator = {
    \   'left': '', 'right': ''
\ }
let g:lightline.subseparator = {
    \   'left': '', 'right': '' 
\ }

" always show sign column
set signcolumn=yes

" use spaces instead of tabs
set expandtab

" indent/outdent 4 spaces at a time
set shiftwidth=4

" show cursorline
set cursorline

" indent guide character
let g:indentLine_char = ':'

" color configurations
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" enable background transparency
hi Normal guibg=NONE ctermbg=NONE

" fix commented text
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" configure rainbow
let g:rainbow_active = 1

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

" enable forward delete in normal mode
nmap <C-d> x

" enable forward word jump with alt-right
nmap <Esc>f e

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
set updatetime=100

" highlight tab characters
highlight SpecialKey ctermfg=1
set list
set listchars=tab:>-

" gruvbox orange
highlight SpecialKey guifg=#fe8019

" gruvbox red
highlight SpecKey guibg=#cc241d

" highlight misleading characters such as en dash, usually from copy & paste
:match SpecKey /–/

" enable mouse support
set mouse=a

" enable mouse scroll
set ttymouse=sgr

" enable system clipboard usage
set clipboard=unnamed

" disable automatic indent
filetype indent off

" enable automatic update for files modified elsewhere
set autoread

" gitgutter configs
" custom icons
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '◖'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_removed_first_line = '●'
let g:gitgutter_sign_modified_removed = '◖●'

" custom colours for GitGutter
" gruvbox yellow
highlight GitGutterChange guifg=#fabd2f
" gruvbox red
highlight GitGutterChangeDelete guifg=#fb4934
" gruvbox aqua
highlight GitGutterAdd guifg=#8ec07c
" gruvbox red
highlight GitGutterDelete guifg=#fb4934

" match sign column background
highlight clear SignColumn

" ale lint settings
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '✘'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
highlight ALEErrorSign guifg=#fb4934
highlight ALEWarningSign guifg=#fabd2f

" disable markdown conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Change cursor shape between insert and normal mode in iTerm2.app
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" eliminate delay when switching from insert to normal mode
set ttimeoutlen=0
