local ls = require("luasnip")
local types = require("luasnip.util.types")
local nvim_lsp = require("lspconfig")
local s = ls.snippet
local r = ls.restore_node
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node

lspsnips = {}

nvim_lsp.clangd.setup{
	on_attach = function(client)
		local orig_rpc_request = client.rpc.request
		function client.rpc.request(method, params, handler, ...)
			local orig_handler = handler
			if method == 'textDocument/completion' then
				-- Idiotic take on <https://github.com/fannheyward/coc-pyright/blob/6a091180a076ec80b23d5fc46e4bc27d4e6b59fb/src/index.ts#L90-L107>.
				handler = function(...)
					local err, result = ...
					if not err and result then
						local items = result.items or result
						for _, item in ipairs(items) do
							-- override snippets for kind `field`, matching the snippets for member initializer lists.
							if item.kind == vim.lsp.protocol.CompletionItemKind.Field and
								item.textEdit.newText:match("^[%w_]+%(${%d+:[%w_]+}%)$") then

								local snip_text = item.textEdit.newText
								local name = snip_text:match("^[%w_]+")
								local type = snip_text:match("%{%d+:([%w_]+)%}")
								-- the snippet is stored in a separate table. It is not stored in the `item` passed to
								-- cmp, because it will be copied there and cmps [copy](https://github.com/hrsh7th/nvim-cmp/blob/ac476e05df2aab9f64cdd70b6eca0300785bb35d/lua/cmp/utils/misc.lua#L125-L143) doesn't account
								-- for self-referential tables and metatables (rightfully so, a response from lsp
								-- would contain neither), both of which are vital for a snippet.
								lspsnips[snip_text] = s("", {
									t(name),
									c(1, {
										-- use a restoreNode to remember the text typed here.
										{t"(", r(1, "type", i(1, type)), t")"},
										{t"{", r(1, "type"), t"}"},
									}, {restore_cursor = true})
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
}


ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " 🞄" } },
            },
        },
    },
}



-- <c-e> is my expansion key
vim.keymap.set({ "i", "s" }, "<C-e>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- <c-t> is my jump backwards key.
vim.keymap.set({ "i", "s" }, "<c-t>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- <c-o> is selecting within a list of options.
vim.keymap.set("i", "<c-o>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set("i", "<c-m>", require "luasnip.extras.select_choice")
