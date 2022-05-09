local od = require("onedark")
local mat = require("material")
local monokai = require('monokai')


local ll = require("lualine")
local gps = require("nvim-gps")

-- od.setup({
--     theme = "deep"
-- })
-- od.load()
--

vim.g.gruvbox_material_background = "hard"

-- monokai.setup()

vim.g.tokyonight_style = "night"

vim.g.neon_style = "doom"

mat.setup({
    lualine_style = "stealth",
    italics = {
        comments = true,
    },
})

vim.g.material_style = "deep ocean"
vim.cmd([[colorscheme material]])
-- vim.cmd([[colorscheme onedark]])

gps.setup({
    separator = "  ",
})

ll.setup({
    sections = {
        lualine_c = {
            {
                "filename",
            },
            {
                gps.get_location,
                cond = gps.is_available
            },
        }
    }
})
