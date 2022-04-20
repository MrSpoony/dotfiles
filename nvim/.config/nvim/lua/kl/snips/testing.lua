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
local m = require("luasnip.extras").m
local rep = require("luasnip.extras").rep
local lambda = require("luasnip.extras").l

local same = function(index)
    return f(function(arg)
        return arg[1]
    end, { index })
end

local line = function(index)
    return f(function(arg)
        local num = string.len(arg[1][1])
        num = num + 6
        return string.rep("-", num)
    end, { index })
end

local rec_ls
rec_ls = function()
    return sn(nil, {
        c(1, {
            -- important!! Having the sn(...) as the first choice will cause infinite recursion.
            t({ "" }),
            -- The same dynamicNode as in the snippet (also note: self reference).
            sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
        }),
    });
end

ls.add_snippets("all", {
    s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    s("betterternary", fmt("{}  ?  {} : {}", {
        i(1, "cond"), i(2, "then"), i(3, "else")
    })),
    ls.parser.parse_snippet("otherternary", "${1:cond} ? ${2:then} : ${3:else}"),
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    s("todo", c(1, { t("test"), t("anothertest"), t("somethinguseful") })),
    s("currtime", f(function()
        return os.date("%D - %H:%M")
    end)),
    s("sametest", fmt("this: {}, and this {} should be synced", { i(1), same(1) })),
    s("boxit", fmt("{}\n-- {} --\n{}", { line(1), i(1), line(1) })),
    s("ls", {
        t({ "\\begin{itemize}",
            "\t\\item " }), i(1), d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }), i(0)
    })
}, { type = "snippets" })


ls.add_snippets("all", {
    s("autoternary", {
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    ls.parser.parse_snippet("autoexpand", "This expadned automatically")
}, { type = "autosnippets" })

local topline = function(index)
    return f(function(arg)
        local num = string.len(arg[1][1])
        num = num + 4
        return "┌" .. string.rep("─", num) .. "┐"
    end, { index })
end
local botline = function(index)
    return f(function(arg)
        local num = string.len(arg[1][1])
        num = num + 4
        return "└" .. string.rep("─", num) .. "┘"
    end, { index })
end

-- Remake some of the UltiSnip snippets

ls.add_snippets("all", {
    -- s("box", {
    --     topline(1),
    --     t("\n│ "), i(1), t("  │\n"),
    --     botline(1),
    -- })
    s("box", fmt( "{}\n│ {}   │\n{}", {
        topline(1),
        i(1),
        botline(1),
    })),
}, { type = "snippets" })
