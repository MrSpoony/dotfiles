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
o.formatoptions:remove("cro")

o.modifiable = true
o.wildmenu = true
o.wildmode = { 'longest:full', 'full' }

o.showmode = false
o.ruler = true
o.showcmd = true
o.laststatus = 3

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

o.scrolloff = 5
o.mouse = "nvc"

o.visualbell = true

o.splitright = true
o.splitbelow = true

o.modifiable = true

o.background = "dark"
o.termguicolors = true

Command("WQ", "wq")
Command("Wq", "wq")
Command("W", "w")
Command("Q", "q")

-- vim.g.netrw_liststyle = 3

vim.cmd([[
filetype plugin on
syntax on
]])

vim.cmd([[
function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()
]])
