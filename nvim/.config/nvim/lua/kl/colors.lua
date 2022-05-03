local od = require("onedark")
local mat = require("material")

local ll = require("lualine")
local gps = require("nvim-gps")

-- od.setup({
--     theme = "deep"
-- })
-- od.load()
--
vim.g.tokyonight_style = "night"

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
