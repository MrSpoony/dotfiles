"
"
" KIMI's NEOVIM config file, linked to .vimrc so it should mostly be also
" compatible with vim 
"
"
"
"


set nocompatible

"
" Plugin installation
"

" Install vim-plug if it isn't already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" neovide
Plug 'neovide/neovide'

Plug 'rhysd/vim-clang-format'
" Themes
Plug 'dylanaraps/wal.vim'

" for nicer bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" To see buffers/tabs in bottom airline bar
Plug 'bling/vim-bufferline'

" For better auto pairinp brackets
Plug 'jiangmiao/auto-pairs'


" Templates
" Plug 'tibabit/vim-templates'

" fzf in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" easymotion to make navigating in the code easier
Plug 'easymotion/vim-easymotion'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" debugger
" Plug 'cpiger/NeoDebug'
Plug 'sakhnik/nvim-gdb', { 'do': ':!.install.sh'}

" for C# coding
Plug 'OmniSharp/omnisharp-vim'
"for C# code highlighting
Plug 'dense-analysis/ale'

" for webdev
Plug 'ap/vim-css-color'

" Debugger
" Plug 'puremourning/vimspector'

Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" Repeat commands
Plug 'tpope/vim-repeat'

" nerdtree for code structure
Plug 'preservim/nerdtree'
" ranger for opening files easier
Plug 'francoiscabrol/ranger.vim'


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Comments
Plug 'tpope/vim-commentary'


" collection of language packs
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Git integration
Plug 'tpope/vim-fugitive'


" Discord precense
Plug 'andweeb/presence.nvim'

" Snippet stuff
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

filetype plugin on
syntax on


" 
" all set commands
"
set background=dark
set clipboard=unnamed,unnamedplus
set nospell
set shiftwidth=4
set encoding=utf-8
set tabstop=4
set expandtab
set autoindent
set number
set relativenumber   
set signcolumn=yes
set showmode
set ruler
set showcmd
set showmatch
set incsearch
set hlsearch
set hidden
set lazyredraw
set noignorecase
set laststatus=2
set autoread
set ofu=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set textwidth=0
set noswapfile
set nobackup
set nowritebackup
set so=7
set mouse=nvc
set visualbell
set t_vb=
set history=1000
set backspace=indent,eol,start
set splitright
set splitbelow
set cmdheight=2
set updatetime=300
set shortmess+=c
set filetype=on
set spelllang=en_US
set wrap
set linebreak
set wildmode=longest:full,full
set undofile


" If i want to use my aliases in vimterminal
" set shellcmdflag=-ic
"
" Indenting 
" set foldmethod=indent
" set foldnestmax=1

" colorscheme theme stuff
colorscheme wal

highlight Comment cterm=italic

source ~/.config/nvim/airline.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/neovide.vim
source ~/.config/nvim/nerdTree.vim
source ~/.config/nvim/omnisharp.vim
source ~/.config/nvim/runFiles.vim
source ~/.config/nvim/ultisnips.vim
source ~/.config/nvim/vimtex.vim

" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q

inoremap :w<CR> <Esc>:w<CR>
inoremap :q<CR> <Esc>:q<CR>
inoremap :q!<CR> <Esc>:q!<CR>


" Set mapleader to space
let mapleader = " "


" for easier moving between windows inside of vim
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-t> :tabnew<CR>


" Disable arrow keys cause I shall better learn those hjkl commands with colemak
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" It just makes sense
nnoremap Y y$


" Search results always in the middle
nnoremap n nzz
nnoremap N Nzz


" add lines above and below without going into insert mode
nmap oo o<Esc>
nmap OO O<Esc>


" reset highlighting of search
map <f3> :noh<CR>


" currently just testing
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

" Move lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==


" auto indentation
map <F7> gg=G<C-o><C-o>


" for faster  access
" maybe deleting it because I never use it...
nmap \<Space> :



" Toggle spellchecker
" Also not really using it currently
map <leader>s :setlocal spell!<CR>


"
" Templates
"

" C++ template
autocmd BufNewFile *.cpp            0r ~/.config/nvim/templates/cpp.cpp
