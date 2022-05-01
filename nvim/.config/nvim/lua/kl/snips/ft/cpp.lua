-- Luasnip stuff
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local lambda = require("luasnip.extras").l
local utils = require("kl.snips")


-- TS stuff

local b = utils.b
local rep = utils.rep;

-- local existsLInt = function()
--     local parser = vim.treesitter.get_parser(0);
--     P(parser)
--     local tstree = parser:parse()
--     P(vim.inspect(getmetatable(tstree)))
--     -- local tsroot = tstree:root()
--     -- P(tsroot:iter_children())
--     return true;
-- end
--
-- existsLInt();


ls.add_snippets("cpp", {
    b("icin", {
        t"lint ", i(1, "name"), t" = 0; cin >> ", rep(1), t{";", ""},
    }),
    b("scin", {
        t"string ", i(1, "name"), t" = \"\"; cin >> ", rep(1), t{";", ""},
    }),
    b("vicin", {
        t"VI ", i(1, "name"), t"(", i(2, "n"), t{");", ""},
        t"REP (", i(3, "i"), t", ", rep(2), t" ) cin >> ",
        rep(1), t"[", rep(3), t{"]", ""}
    })
}, { type = "autosnippets" })
