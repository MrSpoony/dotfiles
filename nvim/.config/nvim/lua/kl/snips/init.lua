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

local utils = {}

utils.snippet = function(name, snippet, opts)
    if (type(snippet) == type("stringtype")) then
        return s(name, t(snippet), opts)
    end
    local realSnip = {}
    for _, v in ipairs(snippet) do
        local currSnip = v
        if type(v) == type("stringtype") then
            currSnip = t(v)
        end
        table.insert(realSnip, currSnip)
    end
    return s(name, realSnip, opts)
end

utils.onBegin = function(line_to_cursor, matched_trigger)
    line_to_cursor = line_to_cursor:gsub("%s+", "")
    if (line_to_cursor == matched_trigger) then
        return true
    end
    return false
end

utils.inWord = function(line, trigger)
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

utils.b = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = utils.onBegin
    return utils.snippet({ trig = name }, snippet, opts)
end

utils.w = function(name, snippet, opts)
    opts = opts or {}
    opts.condition = utils.inWord
    return utils.snippet({ trig = name }, snippet, opts)
end

utils.rep = function(index, mirrorindex)
    if mirrorindex == nil then
        return f(function(arg)
            return arg[1]
        end, { index })
    end
    return d(index, function(args)
        return sn(nil, {
            i(1, args[1])
        })
    end, { mirrorindex })
end

return utils
