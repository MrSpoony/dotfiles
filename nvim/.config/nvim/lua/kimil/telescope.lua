local ts = require('telescope')
local builtin = require('telescope.builtin')

ts.setup {
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
        mappings = {
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        -- }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    }
}


ts.load_extension('fzf')
ts.load_extension('zoxide')



Nnoremap("<leader>ff", LuaFn(builtin.find_files))
Nnoremap("<C-p>",      LuaFn(builtin.git_files))
Nnoremap("<leader>pw", LuaFn(Fn(builtin.grep_string, {search = vim.fn.expand("<cword>")})))
Nnoremap("<leader>fg", LuaFn(builtin.live_grep))
Nnoremap("<leader>fb", LuaFn(builtin.buffers))
Nnoremap("<leader>fh", LuaFn(builtin.help_tags))
