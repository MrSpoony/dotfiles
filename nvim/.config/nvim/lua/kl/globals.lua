local utils = require("kl.utils")

P = function(v)
    print(vim.inspect(v))
    return v
end

Fn = utils.fn

Command = utils.command

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
