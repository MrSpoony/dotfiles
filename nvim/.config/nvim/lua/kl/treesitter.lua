local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

local toInstall = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "dart",
    "dot",
    "fish",
    "go",
    "gomod",
    "haskell",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "latex",
    "llvm",
    "lua",
    "make",
    "markdown",
    "nix",
    "norg",
    "norg_meta",
    "norg_table",
    "python",
    "ruby",
    "rust",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
}

require 'nvim-treesitter.configs'.setup {
    ensure_installed = toInstall,
    sync_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gni",
            scope_incremental = "gns",
            node_decremental = "gnd",
        },
    },
    indent = {
        enable = false,
    },
    highlight = {
        enable = true,
        disable = { "latex" }
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    refactor = {
        highlight_definitions = true,
        highlight_current_scope = {
            enable = false,
        },
        clear_on_cursor_move = false,
    },
    textobjects = {
        enable = true,
        keymaps = {
            ["iL"] = {
                go = "(function_definition) @function",
            },
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ae"] = "@block.outer",
            ["ie"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["is"] = "@statement.inner",
            ["as"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner"
        },
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                -- ["iF"] = {
                --     python = "(function_definition) @function",
                --     cpp = "(function_definition) @function",
                --     c = "(function_definition) @function",
                --     java = "(method_declaration) @function",
                --     go = "(method_declaration) @function"
                -- }
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>si"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>sA"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["<leader>Df"] = "@function.outer",
                ["<leader>DF"] = "@class.outer",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    autotag = {
        enable = true
    }
}
