local hp = require("harpoon")

hp.setup({})

Nnoremap("<leader>a",  "<cmd>lua require('harpoon.mark').add_file()<CR>")
Nnoremap("<C-e>",      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
Nnoremap("<leader>tc", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

Nnoremap("<leader>n",  "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
Nnoremap("<leader>e",  "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
Nnoremap("<leader>i",  "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
Nnoremap("<leader>o",  "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
