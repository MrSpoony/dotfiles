local opts = { silent = true, expr = false }
Vnoremap("<leader>re",  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
Vnoremap("<leader>rf",  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], opts)
Vnoremap("<leader>rv",  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
Vnoremap("<leader>ri",  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

Nnoremap("<leader>rb",  [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], opts)
Nnoremap("<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], opts)

Nnoremap("<leader>ri",  [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)
