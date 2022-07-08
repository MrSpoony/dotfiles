local lsp_installer = require('nvim-lsp-installer')
local clangd_extensions = require('clangd_extensions')
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local tabnine = require('cmp_tabnine')
local lspkind = require('lspkind')
local lspconfigs = require("kl.lspconfigs");
local lspsignature = require("lsp_signature");
-- local golsp = require("go.lsp")
local fidget = require("fidget")
local ls = require("luasnip")
local s = ls.snippet
local r = ls.restore_node
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node

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

fidget.setup({})

local options = lspconfigs.options
local on_attach = lspconfigs.on_attach

local lspsnips = {}

local clang_options = vim.deepcopy(options)
clang_options.on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local orig_rpc_request = client.rpc.request
    function client.rpc.request(method, params, handler, ...)
        local orig_handler = handler
        if method == 'textDocument/completion' then
            handler = function(...)
                local err, result = ...
                if not err and result then
                    local items = result.items or result
                    for _, item in ipairs(items) do
                        if item.kind == vim.lsp.protocol.CompletionItemKind.Field and
                            item.textEdit.newText:match("^[%w_]+%(${%d+:[%w_]+}%)$") then
                            local snip_text = item.textEdit.newText
                            local name = snip_text:match("^[%w_]+")
                            local type = snip_text:match("%{%d+:([%w_]+)%}")
                            lspsnips[snip_text] = s("", {
                                t(name),
                                c(1, {
                                    -- use a restoreNode to remember the text typed here.
                                    { t "(", r(1, "type", i(1, type)), t ")" },
                                    { t "{", r(1, "type"), t "}" },
                                }, { restore_cursor = true })
                            })
                        end
                    end
                end
                return orig_handler(...)
            end
        end
        return orig_rpc_request(method, params, handler, ...)
    end
end

clang_options.cmd = {
    "clangd",
    "-j=4",
    "--query-driver=/usr/bin/g*",
    "--background-index",
    "--clang-tidy",
    "--fallback-style=llvm",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--pch-storage=memory",
}

clangd_extensions.setup({
    server = clang_options
})

lsp_installer.on_server_ready(function(server)
    local opts = options
    if server.name == "gopls" then
        return
        -- opts = golsp.config()
        -- server:setup(opts)
    end
    if server.name == "eslint" then
        opts.on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.server_capabilities.document_formatting = true
        end
        opts.settings = {
            format = { enable = true },
        }
    end
    server:setup(opts)
end)

local compare = cmp.config.compare

local source_mapping = {
    buffer = "[Buffer]",
    luasnip = "[snip]",
    ultisnips = "[snip]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

local tcode = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            if lspsnips[args.body] then
                ls.snip_expand(lspsnips[args.body])
            else
                ls.lsp_expand(args.body)
            end
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    completion = {
        get_trigger_characters = function(trigger_characters)
            return vim.tbl_filter(function(char)
                return char ~= ' '
            end, trigger_characters)
        end
    },
    mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.close();
        ["<C-i>"] = cmp.mapping(
            function()
                ls.expand_or_jump()
            end
        ),
        ["<c-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }, { "i", "c" }
        ),
        ["<c-f>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace, select = true
            }),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace, select = false
            })
        }),
        ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
            )
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },
        -- Yes no tab completion here...
        ["<Tab>"] = cmp.config.disable,
        ["<S-Tab>"] = cmp.config.disable,
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    vim.api.nvim_feedkeys(tcode('<Down>'), 'n', true)
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
                    vim.api.nvim_feedkeys(tcode('<Up>'), 'n', true)
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
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            menu = source_mapping,
            before = function(entry, vim_item)
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
            end
        })
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "cmp_tabnine" },
        -- { name = "ultisnips" },
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
        { name = "cmdline", keyword_pattern=[=[[^[:blank:]\!]*]=], keyword_length = 3}
    })
})
