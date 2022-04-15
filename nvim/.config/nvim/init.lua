require('plugins')

vim.cmd [[

filetype plugin on
syntax on

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
]]
