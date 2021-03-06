local utils = require("kl.snips")
local ls = require("luasnip")
local s = utils.snippet
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

local b = utils.b
local rep = utils.rep

ls.add_snippets("go", {
    b("ef", {
        i(1, "val"), ", err := ", i(2, "f"), "(", i(3), t { ")", "" },
        i(0),
    }),
    b("ife", {
        i(1, "val"), ", ", i(2, "err"), " := ", i(3, "f"), "(", i(4), t { ")", "" },
        "if ", rep(2), t { " != nil {", "\treturn " }, rep(2),
        t { "", "}" },
    }),
}, { type = "autosnippets" })

ls.add_snippets("go", {
    b("fm", {
        t { "func main() {", "\t" },
        i(0),
        t { "", "}" },
    }),
})
