local od = require("onedark")
local mat = require("material")
local monokai = require("monokai")
local gh = require("github-theme");

local spotify_status = require("nvim-spotify").status

local ll = require("lualine")
local gps = require("nvim-gps")

od.setup({
    theme = "deep"
})

vim.g.gruvbox_material_background = "hard"

monokai.setup()

vim.g.tokyonight_style = "night"

vim.g.neon_style = "doom"

mat.setup({
    lualine_style = "stealth",
    italics = { comments = true },
})

vim.g.material_style = "deep ocean"

gps.setup({
    separator = "  ",
})

spotify_status:start()

gh.setup({

})

ll.setup({
    sections = {
        lualine_c = {
            { "filename" },
            {
                gps.get_location,
                cond = gps.is_available
            },
        },
        lualine_x = {
            spotify_status.listen
        }
    }
})
vim.cmd("colorscheme gruvbox-material")
