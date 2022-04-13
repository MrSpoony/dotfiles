require('hop').setup({
    keys = "neioarstdhqwfpyulzxcvkmbj"
})

local prefix = "<cmd>lua require('hop').hint_char1"


vim.api.nvim_set_keymap('n', '<leader><leader>f', prefix .. "({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>F', prefix .. "({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', '<leader><leader>f', prefix .. "({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', '<leader><leader>F', prefix .. "({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('',  '<leader><leader>t', prefix .. "({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('',  '<leader><leader>T', prefix .. "({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>HopWord<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>c', "<cmd>HopChar1<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>g', "<cmd>HopAnywhere<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>j', "<cmd>HopAnywhereAC<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>k', "<cmd>HopAnywhereBC<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>s', "<cmd>HopPattern<cr>", {})
vim.api.nvim_set_keymap('n', '<leader><leader>l', "<cmd>HopLine<cr>", {})
