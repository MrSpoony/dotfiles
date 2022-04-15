require('plugins')

local o = vim.opt

o.clipboard = { 'unnamed', 'unnamedplus' }

o.spelllang = "en_US"
o.spell = false
o.encoding = 'utf-8'

o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.autoindent = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'

o.textwidth = 0
o.colorcolumn ='80'
o.wrap = true
o.linebreak = true

o.cmdheight=2
o.modifiable = true
o.wildmenu = true
o.wildmode= { 'longest:full','full' }

o.showmode = false
o.ruler = true
o.showcmd = true
o.laststatus = 2

o.cmdheight = 2
o.incsearch = true
o.hlsearch = true
o.ignorecase = false
o.path:append("**")

o.hidden = true
o.showmatch = true
o.autoread = true
o.swapfile = false
o.updatetime = 100
o.backup = false
o.history = 10000
o.undofile = true

o.scrolloff = 4
o.mouse = "nvc"

o.visualbell = true

o.splitright = true
o.splitbelow = true

o.modifiable = true

o.background = "dark"
o.termguicolors = true


vim.g.mapleader = " "

require("kimil")

Command("WQ", "wq")
Command("Wq", "wq")
Command("W", "w")
Command("Q", "q")

Inoremap(":w<CR>", "<Esc>:w<CR>")
Inoremap(":wq<CR>", "<Esc>:wq<CR>")
Inoremap(":q!<CR>", "<Esc>:q!<CR>")

Nnoremap("j", "gj")
Nnoremap("k", "gk")
Nnoremap("gj", "j")
Nnoremap("gk", "k")

Vnoremap("j", "gj")
Vnoremap("k", "gk")
Vnoremap("gj", "j")
Vnoremap("gk", "k")

Nnoremap("<Up>", "<Nop>")
Nnoremap("<Down>", "<Nop>")
Nnoremap("<Right>", "<Nop>")
Nnoremap("<Left>", "<Nop>")

Vnoremap("<Up>", "<Nop>")
Vnoremap("<Down>", "<Nop>")
Vnoremap("<Right>", "<Nop>")
Vnoremap("<Left>", "<Nop>")

vim.cmd([[
filetype plugin on
syntax on
]])

vim.cmd([[
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
]])


vim.cmd([[
colorscheme onedark
autocmd ColorScheme * highlight Comment cterm=italic
]])
vim.cmd([[
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

command! Pi PlugInstall
command! Pu PlugUpdate

" Trims all lines at end of files on save
function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
]])
