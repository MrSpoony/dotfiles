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
Plug 'dylanaraps/wal.vim'                                   " Wal theme
Plug 'joshdick/onedark.vim'                                 " Onedark
Plug 'kaicataldo/material.vim', { 'branch': 'main' }        " Material
Plug 'glepnir/dashboard-nvim'                               " Dashboard when opening neovim
Plug 'vim-airline/vim-airline'                              " For nicer bar at the bottom
Plug 'vim-airline/vim-airline-themes'                       " Themes for the bar
Plug 'bling/vim-bufferline'                                 " To see buffers/tabs in bottom airline bar
Plug 'windwp/nvim-autopairs'                                " Auto pairinp brackets
Plug 'tpope/vim-surround'                                   " Surround your stuff easier with brackets or quotes
Plug 'kyazdani42/nvim-web-devicons'                         " Icons like the name implies
Plug 'romgrk/barbar.nvim'                                   " Tab display
Plug 'ryanoasis/vim-devicons'                               " Nice Icons
Plug 'junegunn/goyo.vim'                                    " Distraction free writing
Plug 'neovide/neovide'                                      " Neovide support



" FZF Like Plugins
Plug 'nvim-lua/plenary.nvim'                                " Some helpful lua functions other plugins (telecope) need
Plug 'BurntSushi/ripgrep'                                   " Line-oriented search tool
Plug 'nvim-telescope/telescope.nvim'                        " Telescope search etc.
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'liuchengxu/vim-clap'                                  " Clap (can do some stuff I haven't had the time to configure with Telescope)
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fzf (same reason as Clap)
Plug 'junegunn/fzf.vim'



" Other stuff
Plug 'tpope/vim-repeat'                                     " Repeat commands
Plug 'mg979/vim-visual-multi'                               " Multiple cursors
Plug 'andweeb/presence.nvim'                                " Discord precense
Plug 'wakatime/vim-wakatime'                                " Time counting and stuff
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}            " UndoTree for undo representation
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " TreeSitter for syntax highlighting and code `understanding`
Plug 'nvim-treesitter/playground'                           " TreeSitter playground :TSPlaygroundToggle
Plug 'vimwiki/vimwiki'                                      " Vimwiki notes
Plug 'dhruvasagar/vim-table-mode'                           " Awesome automatic tables
Plug 'voldikss/vim-floaterm'                                " Floating terminal
Plug 'christoomey/vim-tmux-navigator'                       " Integration with Tmux
Plug 'vim-scripts/ZoomWin'                                  " Zoom in on windows
Plug 'kana/vim-textobj-user'                                " For own 'Nouns'
Plug 'mizlan/iswap.nvim/'                                   " Swap function arguments etc.
Plug 'ckarnell/Antonys-macro-repeater'                      " Repeat macros with `.`
Plug 'tpope/vim-eunuch'                                     " Useful UNIX commands


" New 'Verbs'
Plug 'tpope/vim-commentary'                                 " Comments gc
Plug 'junegunn/vim-easy-align'                              " Algin stuff ga
Plug 'vim-scripts/ReplaceWithRegister'                      " Replace without going into visual mode gr
Plug 'christoomey/vim-sort-motion'                          " Sort with gs



" New 'Nouns'
Plug 'phaazon/hop.nvim'                                     " Easymotion but in lua
Plug 'justinmk/vim-sneak'                                   " Try to get rid of s and use it for vim-sneak
Plug 'michaeljsmith/vim-indent-object'                      " Indent object with ii, ai, aI, and iI etc.
Plug 'nvim-treesitter/nvim-treesitter-textobjects'          " Treesitter textobjects f (functions), etc
Plug 'RRethy/nvim-treesitter-textsubjects'                  " Smart textsubjects from treesitter
Plug 'kana/vim-textobj-entire'                              " Whole document ae, ie


" Autocompletion stuff
Plug 'neovim/nvim-lspconfig'                                " Nvim lsp support
Plug 'williamboman/nvim-lsp-installer'                      " Easy installation for lsp's
Plug 'p00f/clangd_extensions.nvim'                          " Clang extension for nvim-lsp
Plug 'hrsh7th/nvim-cmp'                                     " Autocompletion engine
Plug 'hrsh7th/cmp-nvim-lsp'                                 " Nvim-cmp source for neovim's built-in ls client
Plug 'hrsh7th/cmp-buffer'                                   " Nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-path'                                     " Nvim-cmp source for filesystem paths
Plug 'hrsh7th/cmp-cmdline'                                  " Nvim-cmp source for vim's commandline
Plug 'onsails/lspkind-nvim'                                 " Nice Icons in lsp-comp
Plug 'quangnguyen30192/cmp-nvim-ultisnips'                  " Nvim-cmp ultisnips support
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }        " Nvim-cmp tabnine support



Plug 'python-rope/ropevim'                                  " For some Code-actions
Plug 'sheerun/vim-polyglot'                                 " Collection of language packs


" Language specific stuff
Plug 'hdiniz/vim-gradle'                                    " Java Gradle
Plug 'ap/vim-css-color'                                     " CSS
Plug 'mattn/emmet-vim'                                      " HTML
Plug 'rstacruz/sparkup'                                     " Even better HTML
Plug 'neoclide/vim-jsx-improve'                             " For JSX
Plug 'lervag/vimtex'                                        " LaTeX
Plug 'engeljh/vim-latexfmt'                                 " LaTex Formatter
Plug 'iamcco/markdown-preview.nvim'                         " Markdown
Plug 'OmniSharp/omnisharp-vim'                              " C#


" Debugger
" Plug 'idanarye/vim-vebugger'
Plug 'cpiger/NeoDebug'                                      " Debugging stuff
" Plug 'puremourning/vimspector'
Plug 'sakhnik/nvim-gdb', { 'do': ':!.install.sh'}           " Gdb implementation in neovim
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'



" Git
Plug 'tpope/vim-fugitive'                                   " The best Git integration
Plug 'airblade/vim-gitgutter'                               " See changes etc. at the left of the buffer



" Snippets
Plug 'honza/vim-snippets'                                   " Requirement of ultisnips
Plug 'SirVer/ultisnips'                                     " The best ones



" Own plugins
Plug 'MrSpoony/soicode.vim'                                 " For soi stuff with the .stoml support



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
map <f3> ;noh<CR>
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
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" File searching
map <leader>z :Files<CR>
map <leader>b :Ex<CR>

command Pi PlugInstall
command Pu PlugUpdate

" Trims all lines at end of files on save
function TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
