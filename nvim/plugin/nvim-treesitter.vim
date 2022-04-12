lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "c", "c_sharp", "cmake", "cpp", "css", "dart", "dot", "fish", "go", "gomod", "haskell", "html", "http", "java", "javascript", "latex", "llvm", "lua", "make", "markdown", "nix", "python", "rust", "ruby", "json", "toml", "typescript", "vim", "yaml", "vue"},
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
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
}
EOF
