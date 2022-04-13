local lsp_installer = require('nvim-lsp-installer')
local clangd_extensions = require('clangd_extensions')
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local tabnine = require('cmp_tabnine')
local lspkind = require('lspkind')
local cmp_ultisnips = require('cmp_nvim_ultisnips')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')
cmp_ultisnips.setup({})

tabnine:setup({
    max_lines = 1000,
    max_num_results = 10,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..';
    ignored_file_types = {

    },
    show_prediction_strength = true,
})


-- Diagnostics mappings
local opts = { noremap = true, silent = true }
-- Diagnostics in floating window
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- Move to the previous diagnostic in the current buffer
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- Move to the next diagnostic in the current buffer
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- Add buffer diagnostics to the location list
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Only map keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Telescope lsp_code_actions<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>Telescope lsp_range_code_actions<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


-- Setup lspconfig.
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())


lsp_installer.on_server_ready(function(server)
    local options = {
        on_attach = on_attach,
        highlight_hovered_item = true,
        show_guides = true,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        },
        capabilities = capabilities
    }

    if server.name == "eslint" then
        options.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            on_attach(client, bufnr)
        end
        options.settings = {
            format = { enable = true },
        }
        options.flags = {
        }
    end

    if server.name == "clangd" then
        clangd_extensions.setup({
            server = options
        })
    else
        server.setup(server, options)
    end
end)

-- vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
-- vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
-- vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
-- vim.g.UltiSnipsRemoveSelectModeMappings = 0

local compare = cmp.config.compare

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end


cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {

        ["<Tab>"] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        -- ["<Tab>"] = cmp.mapping({
        --     c = function()
        --         if cmp.visible() then
        --             cmp.select_next_item({
        --                 behavior = cmp.SelectBehavior.Insert
        --             })
        --         else
        --             cmp.complete()
        --         end
        --     end,
        --     i = function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item({
        --                 behavior = cmp.SelectBehavior.Insert
        --             })
        --         elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --             vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = function(fallback)
        --         if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --             vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end
        -- }),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        -- ["<S-Tab>"] = cmp.mapping({
        --     c = function()
        --         if cmp.visible() then
        --             cmp.select_prev_item({
        --                 behavior = cmp.SelectBehavior.Insert
        --             })
        --         else
        --             cmp.complete()
        --         end
        --     end,
        --     i = function(fallback)
        --         if cmp.visible() then
        --             cmp.select_prev_item({
        --                 behavior = cmp.SelectBehavior.Insert
        --             })
        --         elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --             return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = function(fallback)
        --         if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --             return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end
        -- }),
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    fallback()
                end
            end
        }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace, select = false
            }),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace, select = false
            })
            -- c = function(fallback)
            --     if cmp.visible() then
            --         cmp.confirm({
            --             behavior = cmp.ConfirmBehavior.Replace, select = false
            --         })
            --     else
            --         fallback()
            --     end
            -- end
        }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end,
    },
    sources = {
        { name = "cmp_tabnine" },
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "buffer" },
    },
    sorting = {
        comparators = {
            compare.offset,
            compare.exact,
            compare.recently_used,
            clangd_extensions.cmp_scores,
            tabnine.compare,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    }
})


cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
    map_char = { tex = '' }
}))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"



cmp.setup.filetype("gitcommit", {
    source = cmp.config.sources({
        { name = "cmp_git" },
    }, {
        { name = "buffer" },
    }
    )
})


cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})
