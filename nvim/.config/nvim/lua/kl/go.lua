local go = require("go")

local lspconfigs = require("kl.lspconfigs")
go.setup({
    go = 'go', -- go command, can be go[default] or go1.18beta1
    goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
    fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
    gofmt = 'gofumpt', --gofmt cmd,
    max_line_len = 120, -- max line length in goline format
    tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
    test_template = '', -- g:go_nvim_tests_template  check gotests for details
    test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
    comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
    icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
    verbose = false, -- output loginf in messages
    lsp_cfg = lspconfigs.options,
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = lspconfigs.on_attach,
    lsp_keymaps = false,
    gopls_cmd = nil, -- Add own golps command
    dap_debug_keymap = false,
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
    -- build_tags = "tag1,tag2",
    textobjects = true,
    -- verbose_tests = false, -- set to add verbose flag to tests
    run_in_floaterm = true,
})

vim.api.nvim_create_autocmd({
    "BufWritePre",
}, {
    pattern = "*.go",
    callback = function()
        local fmt = require("go.format")
        fmt.goimport()
    end
})
