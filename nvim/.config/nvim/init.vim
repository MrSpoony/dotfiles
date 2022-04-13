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

" Themes
Plug 'dylanaraps/wal.vim'                            " Wal theme
Plug 'joshdick/onedark.vim'                          " Onedark
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " Material
Plug 'glepnir/dashboard-nvim'                        " Dashboard when opening neovim
" Bar at the bottom
Plug 'vim-airline/vim-airline'                       " For nicer bar at the bottom
Plug 'vim-airline/vim-airline-themes'                " Themes for the bar
Plug 'bling/vim-bufferline'                          " To see buffers/tabs in bottom airline bar
" Brackets
Plug 'windwp/nvim-autopairs'
" Plug 'jiangmiao/auto-pairs'                          " For better auto pairinp brackets
Plug 'tpope/vim-surround'                            " Surround your stuff easier with brackets or quotes
" Tab display
Plug 'kyazdani42/nvim-web-devicons'                  " Icons like the name implies
Plug 'romgrk/barbar.nvim'                            " For better Tab display



" I have to learn those things onece, I think they're great when you can use
" them propperly
" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Telescope plugin
Plug 'nvim-lua/plenary.nvim'         " Some helpful lua functions other plugins need
Plug 'BurntSushi/ripgrep'            " Line-oriented search tool
Plug 'nvim-telescope/telescope.nvim' " Telescope search etc.
" Clap
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }


" Better Motions and other stuff
Plug 'easymotion/vim-easymotion' " Easymotion to make navigating in the code easier
Plug 'justinmk/vim-sneak'        " Try to get rid of s and use it for vim-sneak
Plug 'mg979/vim-visual-multi'    " Multiple cursors



" Other useful stuff
Plug 'junegunn/vim-easy-align'   " Algin stuff
Plug 'tpope/vim-repeat'          " Repeat commands
Plug 'tpope/vim-commentary'      " Comments



" Autocompletion stuff
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }



Plug 'p00f/clangd_extensions.nvim'

Plug 'python-rope/ropevim'                      " For code-actions
Plug 'sheerun/vim-polyglot'                     " Collection of language packs
" Debugger
" Plug 'idanarye/vim-vebugger'
Plug 'cpiger/NeoDebug'
" Plug 'puremourning/vimspector'
Plug 'sakhnik/nvim-gdb', { 'do': ':!.install.sh'}
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'


" Formatter
Plug 'sbdchd/neoformat' " Prettier



" Language specific stuff
" Java Gradle
Plug 'hdiniz/vim-gradle'
" Webdev
Plug 'ap/vim-css-color'         " For CSS
Plug 'mattn/emmet-vim'          " For HTML
Plug 'rstacruz/sparkup'         " Even better HTML
Plug 'neoclide/vim-jsx-improve' " For JSX
" LaTeX
Plug 'lervag/vimtex'
Plug 'engeljh/vim-latexfmt'
" Markdown
Plug 'iamcco/markdown-preview.nvim'
" SQL
Plug 'exu/pgsql.vim'
" C#
Plug 'OmniSharp/omnisharp-vim' " For C# coding
" Plug 'dense-analysis/ale'      " For C# code highlighting



" Neovide support
Plug 'neovide/neovide'



" Trees
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}            " UndoTree for undo representation
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " TreeSitter for syntax highlighting and code `understanding`
Plug 'nvim-treesitter/playground'



" Git
Plug 'tpope/vim-fugitive'             " The best Git integration
Plug 'airblade/vim-gitgutter'         " See changes etc. at the left of the buffer



" Other stuff
Plug 'andweeb/presence.nvim'          " Discord precense
Plug 'wakatime/vim-wakatime'          " Time counting and stuff
Plug 'christoomey/vim-tmux-navigator' " Integration with Tmux
Plug 'ryanoasis/vim-devicons'         " Nice Icons
Plug 'voldikss/vim-floaterm'          " Floating terminal
Plug 'junegunn/goyo.vim'              " Distraction free writing
Plug 'dhruvasagar/vim-table-mode'     " Awesome automatic tables
Plug 'vimwiki/vimwiki'                " Vimwiki notes
Plug 'vim-scripts/ZoomWin'            " Zoom in on windows



" Snippets
Plug 'honza/vim-snippets'             " Requirement of ultisnips
Plug 'SirVer/ultisnips'               " The best ones



" Own plugins
Plug 'MrSpoony/soicode.vim'           " For soi stuff with the .stoml support



call plug#end()



filetype plugin on
syntax on


" 
" all set commands
"

set clipboard=unnamed,unnamedplus " Share clipboard not vim-only clipboard

set spelllang=en_US               " Language
set nospell                       " Disable by default

set encoding=utf-8                " File encoding

set shiftwidth=4                  " Number of spaces to autoindent
set tabstop=4                     " Number of spaces for a tabstop
set expandtab                     " Expand tab to spaces in insert mode
set autoindent                    " Autoindenting enabled
set backspace=indent,eol,start    " What happens when I press backspace

set number                        " View line numbers at the left side
set relativenumber                " Set relative line numbers
set signcolumn=yes                " For gitgutter and errors in the left sidebar

set textwidth=0                   " Don't insert EOLs at linebreak
set colorcolumn=80                " Column at line 80 so I know where to make a carriage return
set wrap                          " Wrap to long lines around
set linebreak                     " Wrap lines at the breakat parameter (which is currently not set)

set noshowmode                    " Don't show current mode (INSERT, NORMAL, etc.)"
set ruler                         " Always show cursor position
set showcmd                       " Display incomplete commands on lower right
set laststatus=2                  " Always show statusline

set cmdheight=2                   " Use 2 lines for the commandline
set filetype=on                   " Set the standard filetype to on
set modifiable                    " Buffer can be edited
set wildmenu                      " Enable wildmenu
set wildmode=longest:full,full    " How wild mode should behave

set incsearch                     " Incremental search
set hlsearch                      " Highlight search results
set noignorecase                  " Don't ignore case when searching
set path+=**                      " Search everywhere

set hidden                        " Edit another buffer whine another one is unsaved IMPORTANT ONE!!

set ofu=syntaxcomplete#Complete   " Autocompletion so that menu will always appear
set showmatch                     " highlight matching braces

set autoread                      " Automatically read a file that has changed on the disk
set noswapfile                    " Don't use a swapfile
set updatetime=100                " Doesn't matter since I disabled writing to the swapfile
set nobackup                      " Don't create annoying backup files
set history=10000                 " Store last 1000 commands in history
set undofile                      " Save undo stuff for undotree

set scrolloff=3                   " Keep 3 empty lines at the borders when moving with j and k
set mouse=nvc                     " Use mouse in Normal, Visual and Command mode
set visualbell                    " No annoying bell

set splitright                    " Put the new window to the right
set splitbelow                    " Put the new window at the bottom

set modifiable                    " Buffer can be edited



" Set mapleader to space
let mapleader =" "


" Load lua configurations
lua require("kimil")

" Capital case does the same
command WQ wq
command Wq wq
command W w
command Q q
inoremap :w<CR> <Esc>:w<CR>
inoremap :q<CR> <Esc>:q<CR>
inoremap :q!<CR> <Esc>:q!<CR>


" Movement
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" If I want to use my aliases in vimterminal but also prints the fastfetch
" set shellcmdflag=-ic

" Indenting 
" set foldmethod=indent
" set foldnestmax=1

" Themes stuff
" Transparent background
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
set background=dark

" Comments
highlight Comment cterm=italic

" WAL
" colorscheme wal


" ONEDARK
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

let g:netrw_liststyle = 3

" Shortcuts

" C-P to C-E for cycling back the code-completion list
inoremap <expr><C-e> pumvisible() ? "\<C-p>" : "\<C-h>"

" It just makes sense to yank till the end of the line like `C` or `D`
nnoremap Y y$
" Search results always in the middle
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Reset highlighting of search
map <f3> :noh<CR>
" Add lines above and below without going into insert mode
nmap oo o<Esc>
nmap OO O<Esc>
" Move lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <A-j> <esc>:m .+1<CR>==
inoremap <A-k> <esc>:m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" auto indentation
map <F7> gg=G<C-o><C-o>
" Reselect block after indenting
vmap < <gv
vmap > >gv
" Toggle spellchecker
map <leader>sp :setlocal spell!<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" File searching
map <leader>z :Files<CR>
map <leader>ex :Ex<CR>

" Trims all lines at end of files on save
function TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
