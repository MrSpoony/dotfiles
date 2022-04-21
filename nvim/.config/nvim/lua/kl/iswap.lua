require('iswap').setup{
  keys = 'neioarstdhqwfpluyzxcvkmgjb',
  grey = 'enabled',
  hl_snipe = 'Search',
  hl_selection = 'Visual',
  hl_grey = 'Comment',
  autoswap = true,
}


vim.api.nvim_set_keymap('n', '<leader>sw', '<cmd>ISwap<cr>', {})
