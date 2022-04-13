require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'neioarstdhqwfpluyzxcvkmgjb',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'enabled',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  hl_snipe = 'Search',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  hl_selection = 'Visual',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'Comment',

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true,
}


vim.api.nvim_set_keymap('n', '<leader>sw', '<cmd>ISwap<cr>', {})
