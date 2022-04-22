require("bufferline").setup({
    options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    }
})

Nnoremap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
Nnoremap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
Nnoremap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
Nnoremap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
Nnoremap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
Nnoremap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
Nnoremap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
Nnoremap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true })
Nnoremap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
