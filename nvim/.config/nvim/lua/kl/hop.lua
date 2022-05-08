local hop = require('hop')

hop.setup({
    keys = "neioarstdhqwfpyulzxcvkmbj"
})

local pre = "<cmd>lua require('hop')."

local function createHopMap(shortcut, todo)
    vim.api.nvim_set_keymap('n', shortcut, pre .. todo .. "<cr>", {})
    vim.api.nvim_set_keymap('o', shortcut, pre .. todo .. "<cr>", {})
end

createHopMap('<leader><leader>f', "hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true })")
createHopMap('<leader><leader>F', "hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })")
createHopMap('<leader><leader>t', "hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true })")
createHopMap('<leader><leader>T', "hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })")
createHopMap('<leader><leader>s', "hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })")
createHopMap('<leader><leader>S', "hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })")

createHopMap('<leader><leader>j', "hint_lines_skip_whitespace()")
createHopMap('<leader><leader>k', "hint_lines_skip_whitespace()")
createHopMap('<leader><leader>w', "hint_words()")
createHopMap('<leader><leader>a', "hint_anywhere()")
