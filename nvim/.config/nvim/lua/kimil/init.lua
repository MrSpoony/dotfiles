local utils = require("kimil.utils")

P = function(v)
    print(vim.inspect(v))
    return v
end

Fn = utils.fn


LuaFn = utils.luaFn
LuaExpr = utils.luaExpr

Nmap = utils.nmap
Imap = utils.imap
Vmap = utils.vmap
Tmap = utils.tmap
Smap = utils.smap
Omap = utils.omap
Lmap = utils.lmap
Cmap = utils.cmap

Nnoremap = utils.nnoremap
Inoremap = utils.inoremap
Vnoremap = utils.vnoremap
Tnoremap = utils.tnoremap
Snoremap = utils.snoremap
Onoremap = utils.onoremap
Lnoremap = utils.lnoremap
Cnoremap = utils.cnoremap


require("kimil.treesitter")
require("kimil.lsp")
require("kimil.autopairs")
require("kimil.hop")
require("kimil.iswap")
require("kimil.telescope")
