require('kimil.globals')
require('kimil.plugins')

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
o.colorcolumn = '80'
o.wrap = true
o.linebreak = true

o.modifiable = true
o.wildmenu = true
o.wildmode = { 'longest:full', 'full' }

o.showmode = false
o.ruler = true
o.showcmd = true
o.laststatus = 2

o.cmdheight = 1
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


local function setBGTransparent() vim.cmd([[autocmd ColorScheme * highlight Normal ctermbg=none guibg=none]]) end

local function setOnedark() vim.cmd([[colorscheme onedark]]) end
local function setMaterial() vim.cmd([[colorscheme material]]) end

setMaterial() -- So the `unused function` message is gone
setBGTransparent()
setOnedark()

vim.g.netrw_liststyle = 3

Nnoremap("n", "nzzzv")
Nnoremap("N", "Nzzzv")


Nnoremap("J", "mzJ`z")


Nnoremap("<Esc>", "<cmd>noh<CR>")

Nnoremap("oo", "o<Esc>")
Nnoremap("OO", "O<Esc>")

Vnoremap("<A-j>", ";m '>+1<CR>gv=gv")
Vnoremap("<A-k>", ";m '<-2<CR>gv=gv")

Inoremap("<A-k>", "<cmd>m .-2<CR><Esc>==a")
Inoremap("<A-j>", "<cmd>m .+1<CR><Esc>==a")

Nnoremap("<A-j>", "<cmd>m .+1<CR>==")
Nnoremap("<A-k>", "<cmd>m .-2<CR>==")

Nnoremap("<leader>sp", LuaFn(function() vim.wo.spell = not vim.wo.spell end))

Nnoremap("<leader>l", "<cmd>bnext<CR>")
Nnoremap("<leader>h", "<cmd>bprev<CR>")
Nnoremap("<leader>+", "<cmd>vertical resize +5<CR>")
Nnoremap("<leader>-", "<cmd>vertical resize -5<CR>")

Nnoremap(":", ";")
Nnoremap(";", ":")
Vnoremap(":", ";")
Vnoremap(";", ":")

Nnoremap("<leader>n", "<cmd>Ex<CR>")

Command("Pi", "PackerInstall")
Command("Pu", "PackerUpadte")

vim.cmd([[
function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
]])
