local ts = require('telescope')
local builtin = require('telescope.builtin')
local themes = require("telescope.themes")
ts.setup {
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
        mappings = {
        },
        history = {
            path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
            limit = 10000,
        }
    },
    pickers = {
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {
            themes.get_dropdown({})
        },
    }
}

local le = ts.load_extension
le('file_browser')
le('fzf')
le('zoxide')
le('packer')
le('ui-select')
le('smart_history')
le('frecency')
le('cheat')
le('refactoring')
le('neoclip')
le('git_worktree')

local ex = ts.extensions
Vnoremap("<leader>fp", "<cmd>Telescope neoclip<cr>")
Vnoremap("<leader>rr", ex.refactoring.refactors)
Nnoremap("<leader>cd", ex.zoxide.list)
Nnoremap("<leader>ff", builtin.find_files)
Nnoremap("<leader>fr", ex.frecency.frecency)
Nnoremap("<leader>fd", ex.git_worktree.git_worktrees)
Nnoremap("<leader>fw", ex.git_worktree.create_git_worktree)
Nnoremap("<leader>fb", "<cmd>Telescope file_browser<cr>")
Nnoremap("<C-p>", builtin.git_files)
Nnoremap("<leader>fs", Fn(builtin.grep_string, { search = vim.fn.expand("<cword>") }))
Nnoremap("<leader>fc", builtin.colorscheme)
Nnoremap("<leader>fm", builtin.keymaps)
Nnoremap("<leader>fg", builtin.live_grep)
Nnoremap("<leader>fh", builtin.help_tags)
