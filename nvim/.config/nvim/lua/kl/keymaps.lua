Nnoremap("j", "gj")
Nnoremap("k", "gk")
Nnoremap("gj", "j")
Nnoremap("gk", "k")

Vnoremap("j", "gj")
Vnoremap("k", "gk")
Vnoremap("gj", "j")
Vnoremap("gk", "k")

-- Nnoremap("<Up>", "<cmd>resize +2<cr>")
-- Nnoremap("<Down>", "<cmd>resize -2<cr>")
-- Nnoremap("<Left>", "<cmd>vertical resize +2<cr>")
-- Nnoremap("<Right>", "<cmd>vertical resize -2<cr>")

Vnoremap("<Up>", "<Nop>")
Vnoremap("<Down>", "<Nop>")
Vnoremap("<Right>", "<Nop>")
Vnoremap("<Left>", "<Nop>")

Nnoremap("n", "nzzzv")
Nnoremap("N", "Nzzzv")

Nnoremap("J", "mzJ`z")

Nnoremap("<Esc>", "<cmd>noh<CR><cmd>call sneak#cancel()<CR>")
vim.keymap.set("", "<C-e>", "<Plug>Sneak_;")

Nnoremap("oo", "o<Esc>")
Nnoremap("OO", "O<Esc>")

Vnoremap("<leader><Up>",   "<cmd>'<,'>m '>+1<CR>gv=gv")
Vnoremap("<leader><Down>", "<cmd>'<,'>m '<-2<CR>gv=gv")
Nnoremap("<leader><Up>",   "<cmd>m .+1<CR>==")
Nnoremap("<leader><Down>", "<cmd>m .-2<CR>==")

Nnoremap("<leader>sp", function() vim.wo.spell = not vim.wo.spell end)

Nnoremap("<leader>+", "<cmd>vertical resize +5<CR>")
Nnoremap("<leader>-", "<cmd>vertical resize -5<CR>")

local source = function()
    Nnoremap("<leader>so", "<cmd>w<CR><cmd>so %<CR>")
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.lua", "*.vim"},
    callback = source
})


Nnoremap("<leader>q", "<cmd>bdelete!<CR>")
Nnoremap("<leader>bq", "<cmd>quit!<CR>")
Nnoremap("<leader>bd", "<cmd>bdelete<CR>")
Nnoremap("<leader>ba", "<cmd>quitall!<CR>")

Nnoremap(":", ";")
Nnoremap(";", ":")
Vnoremap(":", ";")
Vnoremap(";", ":")

Command("Pi", "PackerInstall")
Command("Pu", "PackerUpdate")
