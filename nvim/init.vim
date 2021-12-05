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

" Templates
" Plug 'tibabit/vim-templates'

" fzf in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

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
" nerdcommenter
Plug 'preservim/nerdcommenter'

" collection of language packs
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Discord precense
Plug 'andweeb/presence.nvim'

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
" set shellcmdflag=-ic
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


" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q

let mapleader = " "
" for easier moving between windows inside of vim
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
map <C-q> :q<CR>

nnoremap <C-t> :tabnew<CR>


nnoremap Y y$

nnoremap n nzz
nnoremap N Nzz


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==


" auto indentation
map <F7> gg=G<C-o><C-o>

" for faster  access
nmap \<Space> :
inoremap ;; <Esc>
inoremap .. <Esc>


" Toggle spellchecker
map <leader>s :setlocal spell!<CR>


" add lines above and below without going into insert mode
nmap oo o<Esc>
nmap OO O<Esc>

" reset highlighting of search
map <f3> :noh<CR>



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


nmap <leader>u :UndotreeToggle<CR>

"
" Nerdcommenter stuff
"

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmplyLines = 1
let g:NEADToggleCheckAllLines = 1

"
" Telescope stuff
"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



"
" Templates
"

autocmd BufNewFile *.cpp            0r ~/.config/nvim/templates/cpp.cpp


"
" Vimspector Configuration
"

" let g:vimspector_enable_mappings = 'HUMAN'
" let g:vimspector_install_gadgets = [
"         \ 'debugpy'
"       \ ]
