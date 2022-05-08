local utils = require("kl.utils")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local M = {}

local function set_default_formatter_for_filetypes(language_server_name, filetypes)
    if not utils.set_contains(filetypes, vim.bo.filetype) then return end

    local active_servers = {}

    vim.lsp.for_each_buffer_client(0, function(client)
        table.insert(active_servers, client.config.name)
    end)

    if not utils.set_contains(active_servers, language_server_name) then return end

    vim.lsp.for_each_buffer_client(0, function(client)
        if client.name ~= language_server_name then
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    end)
end

M.on_attach = function(client, bufnr)

    set_default_formatter_for_filetypes("gopls", { "go" })
    set_default_formatter_for_filetypes("eslint", { "javascript", "javascriptreact" })

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    -- Diagnostics mappings
    Nnoremap('<space>df', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    Nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    Nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    Nnoremap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    Nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    Nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    Nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    Nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    Nnoremap('<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    Nnoremap('<C-m>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    Nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    Nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    Nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    Nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    Nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- Nnoremap('<leader>ca', '<cmd>Telescope lsp_code_actions<CR>', opts)
    -- Vnoremap('<leader>ca', '<cmd>Telescope lsp_range_code_actions<CR>', opts)
    Nnoremap('<leader>ca', vim.lsp.buf.code_action, opts)
    Vnoremap('<leader>ca', vim.lsp.buf.range_code_action, opts)
    -- Nnoremap('<m-cr>', '<cmd>Telescope lsp_code_actions<CR>', opts)
    -- Nnoremap('<a-cr>', '<cmd>Telescope lsp_code_actions<CR>', opts)
    Nnoremap('<m-cr>', vim.lsp.buf.code_action, opts)
    Nnoremap('<a-cr>', vim.lsp.buf.code_action, opts)
    Nnoremap('<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    Nnoremap('<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.options = {
    on_attach = M.on_attach,
    highlight_hovered_item = true,
    show_guides = true,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities
}

return M
