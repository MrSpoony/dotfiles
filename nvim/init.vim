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

call plug#begin('~/.vim/plugged')

" neovide
Plug 'neovide/neovide'

Plug 'rhysd/vim-clang-format'
" Themes
Plug 'dylanaraps/wal.vim'
Plug 'joshdick/onedark.vim'

" Dashboard when opening neovim
Plug 'glepnir/dashboard-nvim'

" for nicer bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" To see buffers/tabs in bottom airline bar
Plug 'bling/vim-bufferline'

" For better auto pairinp brackets
Plug 'jiangmiao/auto-pairs'



" For better Tab display
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" " Templates
" Plug 'tibabit/vim-templates'

" " fzf in vim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" Telescope plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" easymotion to make navigating in the code easier
Plug 'easymotion/vim-easymotion'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For code-actions
Plug 'python-rope/ropevim'

" Formatter

" debugger
" Plug 'cpiger/NeoDebug'
Plug 'sakhnik/nvim-gdb', { 'do': ':!.install.sh'}


" for C# coding
Plug 'OmniSharp/omnisharp-vim'
"for C# code highlighting
Plug 'dense-analysis/ale'

" for webdev
Plug 'ap/vim-css-color'

" for SQL
Plug 'exu/pgsql.vim'

" for gradle stuff
Plug 'hdiniz/vim-gradle'

" Debugger
" Plug 'puremourning/vimspector'

Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" Repeat commands
Plug 'tpope/vim-repeat'

" nerdtree for code structure
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'

" ranger for opening files easier
" Plug 'francoiscabrol/ranger.vim'


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Comments
Plug 'tpope/vim-commentary'


" collection of language packs
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Git integration
Plug 'tpope/vim-fugitive'
" Better git integration ig
Plug 'airblade/vim-gitgutter'


" Discord precense
Plug 'andweeb/presence.nvim'

" Time counting and stuff
Plug 'wakatime/vim-wakatime'

" Snippet stuff
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

filetype plugin on
syntax on


" 
" all set commands
"
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
set updatetime=100
set shortmess+=c
set filetype=on
set spelllang=en_US
set wrap
set linebreak
set wildmode=longest:full,full
set undofile
set modifiable

" Set mapleader to space
let mapleader =" "
" let mapleader = <20>

" If i want to use my aliases in vimterminal
" set shellcmdflag=-ic
"
" Indenting 
" set foldmethod=indent
" set foldnestmax=1

" colorscheme theme stuff
set background=dark
" colorscheme wal

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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


 colorscheme onedark

highlight Comment cterm=italic

source ~/.config/nvim/airline.vim
source ~/.config/nvim/dashboard.vim
source ~/.config/nvim/barbar.vim
source ~/.config/nvim/ultisnips.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/gitgutter.vim
source ~/.config/nvim/neovide.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/nerdTree.vim
source ~/.config/nvim/omnisharp.vim
source ~/.config/nvim/runFiles.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/pgsql.vim
source ~/.config/nvim/undotree.vim

" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q

inoremap :w<CR> <Esc>:w<CR>
inoremap :q<CR> <Esc>:q<CR>
inoremap :q!<CR> <Esc>:q!<CR>



" Trying to remap <C-p> for moving between snippet results to <C-e>
" imap <C-e> <C-p>
" inoremap <expr><C-p> pumvisible() ? "\<C-e>" : "\<C-p>"
inoremap <expr><C-e> pumvisible() ? "\<C-p>" : "\<C-h>"

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
inoremap <A-j> <esc>:m .+1<CR>==
inoremap <A-k> <esc>:m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==


" auto indentation
map <F7> gg=G<C-o><C-o>


" for faster  access
" maybe deleting it because I never use it...
nmap \<Space> :



" Toggle spellchecker
" Also not really using it currently
map <leader>s :setlocal spell!<CR>


" Trims all lines at end of files on save
function TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call TrimEndLines()


"
" Templates
"

" C++ template
autocmd BufNewFile *.cpp            0r ~/.config/nvim/templates/cpp.cpp
