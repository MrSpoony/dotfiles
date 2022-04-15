local ts = require('telescope')
local builtin = require('telescope.builtin')

ts.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {

        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
    }
}
ts.load_extension('fzf')

Nnoremap("<leader>ff", LuaFn(builtin.find_files))
Nnoremap("<C-p>",      LuaFn(builtin.git_files))
Nnoremap("<leader>pw", LuaFn(Fn(builtin.grep_string, {search = vim.fn.expand("<cword>")})))
Nnoremap("<leader>fg", LuaFn(builtin.live_grep))
Nnoremap("<leader>fb", LuaFn(builtin.buffers))
Nnoremap("<leader>fh", LuaFn(builtin.help_tags))
