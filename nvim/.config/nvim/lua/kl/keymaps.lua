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

Nnoremap("n", "nzzzv")
Nnoremap("N", "Nzzzv")

Nnoremap("J", "mzJ`z")

Nnoremap("<Esc>", "<cmd>noh<CR>")

Nnoremap("oo", "o<Esc>")
Nnoremap("OO", "O<Esc>")

Vnoremap("<A-j>", "<cmd>'<,'>m '>+1<CR>gv=gv")
Vnoremap("<A-k>", "<cmd>'<,'>m '<-2<CR>gv=gv")
Inoremap("<A-j>", "<cmd>m .+1<CR><Esc>==a")
Inoremap("<A-k>", "<cmd>m .-2<CR><Esc>==a")
Nnoremap("<A-k>", "<cmd>m .-2<CR>==")

Nnoremap("<leader>sp", function() vim.wo.spell = not vim.wo.spell end)

Nnoremap("<A-j>", "<cmd>m .+1<CR>==")
Nnoremap("<leader>l", "<cmd>bnext<CR>")
Nnoremap("<leader>h", "<cmd>bprev<CR>")
Nnoremap("<leader>+", "<cmd>vertical resize +5<CR>")
Nnoremap("<leader>-", "<cmd>vertical resize -5<CR>")

Nnoremap("<leader>so", "<cmd>w<CR><cmd>so %<CR>")

Nnoremap(":", ";")
Nnoremap(";", ":")
Vnoremap(":", ";")
Vnoremap(";", ":")

Nnoremap("<leader>n", "<cmd>Ex<CR>")

Command("Pi", "PackerInstall")
Command("Pu", "PackerUpadte")
