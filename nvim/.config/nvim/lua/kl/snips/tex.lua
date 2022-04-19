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

ls.cleanup()

local tex = {}

tex.math = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex.text = function()
    return not tex.math()
end

tex.beginMath = function(line_to_cursor, matched_trigger)
    return tex.math() and tex.onBegin(line_to_cursor, matched_trigger)
end

tex.beginText = function(line_to_cursor, matched_trigger)
    return tex.text() and tex.onBegin(line_to_cursor, matched_trigger)
end

tex.onBegin = function(line_to_cursor, matched_trigger)
    line_to_cursor = line_to_cursor:gsub("%s+", "")
    if (line_to_cursor == matched_trigger) then
        return true
    end
    return false
end

tex.inWord = function(line, trigger)
    line = line:gsub("^%s*", "")
    line = line:gsub("%s*$", "")
    if (line == trigger) then
        return true
    else
        local start, ending = string.find(line, trigger)
        while start do
            local x = string.sub(line, start - 1, start - 1)
            local y = string.sub(line, ending + 1, ending + 1)
            if (x == " " or x == "\t" or x == "\n" or x == "\r") and
                (y == " " or y == "\t" or y == "\n" or y == "\r") then
                return true
            end
            start, ending = string.find(line, trigger, start + 1)
        end
        return true
    end
    return false
end

tex.frac = function(line, trigger)
    if tex.text() then return false end
    local currPos = vim.api.nvim_win_get_cursor(0)
    -- line = line:gsub("[^%(%)]", "")
    local openCount = 0;
    local changed = false;
    for j = 1, string.len(line) do
        if (j > currPos[2]) then break end
        local char = string.sub(line, j, j)
        if char == "(" then
            openCount = openCount + 1
            changed = true;
        elseif char == ")" then
            openCount = openCount - 1
            changed = true;
        end
    end
    return changed and openCount == 0 and string.sub(line, currPos[2] - 1, currPos[2] - 1) == ")"
end

local b = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.onBegin
    return s({ trig = name }, snippet, opts)
end

local ixt = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.text
    return s({ trig = name, wordTrig = false }, snippet, opts)
end

local w = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.inWord
    return s({ trig = name }, snippet, opts)
end

local imt = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.math
    return s({ trig = name, wordTrig = false }, snippet, opts)
end

local m = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = tex.math
    return s(name, snippet, opts)
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
                t { "",
                    "    \\item[" }, i(1, "name"), t "] ", i(2, "description"), d(3, rep_desc, {}) }),
        }),
    });
end

local fracBrac = function(index)
    return d(index, function()
        local currPos = vim.api.nvim_win_get_cursor(0)
        local x = currPos[2]
        local line = vim.api.nvim_get_current_line()
        local depth = 0
        line = string.sub(line, 1, x - 1)
        local j = string.len(line)
        while true do
            if string.sub(line, j, j) == ")" then depth = depth + 1 end
            if string.sub(line, j, j) == "(" then depth = depth - 1 end
            if depth == 0 then break end
            j = j - 1
            if j == -1 then break end
        end
        return sn(nil, {
            t(string.sub(line, 1, j - 1) .. "\\frac{" .. string.sub(line, j + 1, x - 2) .. "}{"), i(1), t("}"), i(0)
        })
    end)
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
    ixt("->", t "$\\rightarrow$"),
    ixt("<-", t "$\\leftarrow$"),
    ixt("...", t "\\ldots"),
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
        t { "\\begin{itemize}",
            "    \\item " }, i(1), d(2, rep_it, {}),
        t { "", "\\end{itemize}" }, i(0)
    }),
    b("enum", {
        t { "\\begin{enumerate}",
            "    \\item " }, i(1), d(2, rep_it, {}),
        t { "", "\\end{enumerate}" }, i(0)
    }),
    b("desc", {
        t { "\\begin{description}",
            "    \\item[" }, i(1, "name"), t "] ", i(2, "description"), d(3, rep_desc, {}),
        t { "", "\\end{description}" }, i(0)
    }),
    w("mk", {
        t "$", i(1), t "$"
    }),
    w("dm", {
        t { "\\[", "" },
        i(1),
        t { "", ".\\] " }, i(0)
    }),
    imt("//", {
        t"\\frac{", i(1), t"}{", i(2), t"}", i(0)
    }),
    m({ trig = "^.*%(.*%)/", regTrig = true }, {
        fracBrac(1)
    }),
}, { type = "autosnippets" })


ls.add_snippets("tex", {
    b("pac", {
        t "\\usepackage[", i(1, "options"), t "]{", i(2, "package"), t { "}", "" }, i(0)
    }),
})
