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
local lambda = require("luasnip.extras").l

ls.cleanup()

local tex = {}

tex.math = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex.text = function()
    return not tex.math()
end

tex.beginMath = function(line_to_cursor, matched_trigger)
    return tex.math() and tex.begin(line_to_cursor, matched_trigger)
end

tex.beginText = function(line_to_cursor, matched_trigger)
    return tex.text() and tex.begin(line_to_cursor, matched_trigger)
end

tex.begin = function(line_to_cursor, matched_trigger)
    print(line_to_cursor)
    print(matched_trigger)
    line_to_cursor = line_to_cursor:gsub("%s+", "")
    if (line_to_cursor == matched_trigger) then
        return true
    end
    return false
end

local b = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.begin
    return s({ trig = name }, snippet, opts)
end

local it = function(name, snippet, opts)
    opts = opts or {}
    return s({ trig = name, wordTrig = false }, snippet, opts)
end

local inb = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.begin
    return s({ trig = name, wordTrig = false }, snippet, opts)
end


local rep = function(index)
    return f(function(arg)
        return arg[1]
    end, { index })
end

local same = function(index, mirrorindex)
    return d(index, function(args)
        return sn(nil, {
            i(1, args[1])
        })
    end, { mirrorindex })
end

local rep_it
rep_it = function()
    return sn(nil, {
        c(1, {
            t({ "" }),
            sn(nil, { t({ "", "    \\item " }), i(1), d(2, rep_it, {}) }),
        }),
    });
end

local rep_desc
rep_desc = function()
    return sn(nil, {
        c(1, {
            t({ "" }),
            sn(nil, {
                t({ "",
                "    \\item["}, i(1, "name"), t{"]" }), i(2, "description"), d(3, rep_desc, {}) }),
        }),
    });
end

ls.add_snippets("tex", {
    b("textemp", {
        t {
            "\\documentclass[a4paper]{article}",
            "\\usepackage[utf8]{inputenc}",
            "\\usepackage[ngerman]{babel}",
            "",
            "\\title{" }, i(1, "title"), t { "}",
            "\\author{Kimi Löffel}",
            "",
            "\\begin{document}",
            "", "" },
            i(0, "main content"), t { "",
            "",
            "\\end{document}", }
    }),
    b("beg", {
        t "\\begin{", i(1, "name"), t { "}", "" },
        i(0), t { "",
            "\\end{" }, rep(1), t "}"
    }),
    it("->", t "$\\rightarrow$"),
    it("...", t "\\ldots"),
    b("fig", {
        t "\\begin{figure}[", i(1, "htpb"), t { "]",
            "    \\centering", "    " },
        i(2, "\\includegraphics[width=0.8\textwidth]"), t "{", i(3), t { "}", "" },
        t "    \\caption{", same(4, 3), t { "}", "" },
        t "    \\label{fig:", same(5, 3), t { "}",
            "\\end{figure}"
        }
    }),
    b("item", {
        t{ "\\begin{itemize}",
        "    \\item " }, i(1), d(2, rep_it, {}),
        t{ "", "\\end{itemize}" }, i(0)
    }),
    b("enum", {
        t{ "\\begin{enumerate}",
        "    \\item " }, i(1), d(2, rep_it, {}),
        t{ "", "\\end{enumerate}" }, i(0)
    }),
    -- b("desc", {
    --     t{ "\\begin{description}",
    --     "    \\item[" }, i(1, "name"), t"] ", i(2, "description"), d(3, rep_desc, {}),
    --     t{ "", "\\end{description}" }, i(0)
    -- })
}, { type = "autosnippets" })
