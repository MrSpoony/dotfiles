set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
call plug#end()

syntax on
set background=dark
set clipboard=unnamed,unnamedplus
set nospell
set shiftwidth=4                    " number of spaces to autoindent
set encoding=utf-8
set tabstop=4                       " number of spaces for a tabstop
set expandtab                       " expand tab to spaces in insert mode
set autoindent                      " enable autoindenting
set number                          " view line numbers
set relativenumber   
set showmode                        " show current mode
set ruler                           " always show cursor position
set showcmd                         " display incomplete commands on lower right
set showmatch                       " highlight matching braces 
set incsearch                       " incremental search
set hlsearch                        " hightlight search results
set hidden                          " edit another buffer while another one is unsaved IMPORTANT!
set lazyredraw                      " don't update the display while executing macros
set laststatus=2                    " always show status line
set autoread                        " automatically read a file that has changed on disk
set ofu=syntaxcomplete#Complete     " autocompletion so that menu will always appear
set wildmenu                        " enable wildmenu
set wildmode=list:longest,full      " how wild mode should behave
set textwidth=0                     " don't insert EOLs at linebreak
set noswapfile                      " Don't use swapfile
set nobackup                        " Don't create annoying backup files
set nowritebackup
set so=7                            " keep 7 empty lines from the cursor to the border when scrolling with j or k
set mouse=a
set visualbell                      " no annoying beeping
set t_vb=
set history=1000
set backspace=indent,eol,start
set splitright
set splitbelow
set cmdheight=2


" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q

let mapleader = ","

" for faster commandline access
nmap \<Space> :

" Ctrl+W and Q in VIM
map <C-s> :w<CR>
map <C-w> :q<CR>
map <C-t> :tabnew<CR>

" add lines above and below without going into insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

" reset highlighting of search
map <f3> :noh<CR>

" Ctrl+B toggles NERDTree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'


" Disable arrow keys cause I shall better learn those hjkl commands in colemak
" or use colemak maps
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" nnoremap h h|xnoremap h h
" nnoremap n j|xnoremap n j
" nnoremap e k|xnoremap e k
" nnoremap i l|xnoremap i l
" nnoremap j e|xnoremap j e
" nnoremap k n|xnoremap k n
" nnoremap l i|xnoremap l i


" airline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enablod = 1 
