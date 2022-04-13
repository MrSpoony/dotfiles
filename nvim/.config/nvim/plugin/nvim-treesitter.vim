lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "c", "c_sharp", "cmake", "cpp", "css", "dart", "dot", "fish", "go", "gomod", "haskell", "html", "http", "java", "javascript", "latex", "llvm", "lua", "make", "markdown", "nix", "python", "rust", "ruby", "json", "toml", "typescript", "vim", "yaml", "vue"},
    sync_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
            },
    },
    indent = {
        enable = true,
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
        lint_events = {"BufWrite", "CursorHold"},
    },
}
EOF
