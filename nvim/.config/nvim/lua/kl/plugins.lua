vim.cmd([[packadd packer.nvim]])


return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- Dependencies for others
    use { "nvim-lua/popup.nvim" }                           -- Popups
    use { "rcarriga/nvim-notify" }                          -- Notifcations
    use { "nvim-lua/plenary.nvim" }                         -- Some helpful lua functions other plugins (telecope) need
    use { "ray-x/guihua.lua", run = 'cd lua/fzy && make' }  -- UI for lua plugins
    use { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } } -- Store stuff in sqlite database for more speed
    use { "BurntSushi/ripgrep" }                            -- Line-oriented search tool
    use { "junegunn/fzf", run = "./install -- all" }        -- FZF
    use { "junegunn/fzf.vim" }                              -- FZF in vim
    use { "anuvyklack/nvim-keymap-amend" }                  -- Amend to existing keymaps
    use { "mbbill/undotree" }                               -- Undo representation
    use { "kyazdani42/nvim-tree.lua" }                      -- File structure

    -- UI
    -- Themes:
    use { "dylanaraps/wal.vim" }                          -- Wal
    use { "Mofiqul/dracula.nvim" }                        -- Dracula
    use { "folke/tokyonight.nvim" }                       -- Tokyo night
    use { "marko-cerovac/material.nvim" }                 -- Material
    use { "navarasu/onedark.nvim" }                       -- Onedark
    use { "ChristianChiarulli/nvcode-color-schemes.vim" } -- Multiple themes
    use { "sainnhe/gruvbox-material" }                    -- Gruvbox
    use { "luisiacc/gruvbox-baby" }                       -- Gruvbox
    use { "tanvirtin/monokai.nvim" }                      -- Monokai
    use { "shaunsingh/nord.nvim" }                        -- Nord
    use { "rafamadriz/neon" }                             -- Neon

    use { "anuvyklack/pretty-fold.nvim" }  -- Prettier folds
    use { "SmiteshP/nvim-gps" }            -- Location widget in lualine
    use { "nvim-lualine/lualine.nvim" }    -- Line at the bottom
    use { "j-hui/fidget.nvim" }            -- Loading bar for lsp
    use { "justinmk/vim-syntax-extra" }    -- Extra syntax
    use { "mhinz/vim-startify" }           -- Fancy startup screen `:h startify` `:h startify-faq`
    use { "tpope/vim-obsession" }          -- Session management
    use { "stevearc/dressing.nvim" }       -- Better standard vim ui's
    use { "karb94/neoscroll.nvim" }        -- Smooth scroll
    use { "kyazdani42/nvim-web-devicons" } -- Icons like the name implies
    use { "akinsho/bufferline.nvim" }      -- Tab display
    use { "junegunn/goyo.vim" }            -- Distraction free writing
    use { "junegunn/limelight.vim" }       -- Beautify goyo
    use { "neovide/neovide" }              -- Neovide support


    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- TreeSitter for syntax highlighting and code `understanding`
    use { "nvim-treesitter/playground" }                         -- TreeSitter playground :TSPlaygroundToggle
    use { "nvim-treesitter/nvim-treesitter-refactor" }           -- Refactoring tools
    use { "nvim-treesitter/nvim-treesitter-textobjects" }        -- Treesitter textobjects f (functions), etc
    use { "RRethy/nvim-treesitter-textsubjects" }                -- Smart textsubjects from treesitter
    use { "p00f/nvim-ts-rainbow" }                               -- Rainbow brackets from treesitter
    use { "simrat39/symbols-outline.nvim" }                      -- Symbols outline
    use { "windwp/nvim-ts-autotag" }                             -- Close tags


    use { "milisims/nvim-luaref" } -- Reference for builtin lua functions
    use { "nanotee/luv-vimdocs" }  -- Luv docs as a vim plugin


    -- Telescope
    use { "nvim-telescope/telescope.nvim" }                      -- Telescope search etc.
    use { "jvgrootveld/telescope-zoxide" }                       -- Like z command
    use { "nvim-telescope/telescope-packer.nvim" }               -- Packer plugins
    use { "nvim-telescope/telescope-symbols.nvim" }              -- Symbols
    use {
        "nvim-telescope/telescope-fzf-native.nvim", run = "make"
    }                                                            -- FZF Performance and syntax
    use { "nvim-telescope/telescope-file-browser.nvim" }         -- File browser
    use { "nvim-telescope/telescope-ui-select.nvim" }            -- Use floating ui for codeactions
    use { "nvim-telescope/telescope-smart-history.nvim" }        -- Store search history in sqlite database
    use { "nvim-telescope/telescope-frecency.nvim" }             -- Frequently visited files
    use { "nvim-telescope/telescope-cheat.nvim" }                -- Cheat.sh


    -- Other stuff
    use { "tpope/vim-repeat" }                              -- Repeat commands
    use { "mg979/vim-visual-multi" }                        -- Multiple cursors
    use { "windwp/nvim-autopairs" }                         -- Auto pairing brackets
    use { "tpope/vim-surround" }                            -- Surround your stuff easier with brackets or quotes
    use { "andweeb/presence.nvim" }                         -- Discord precense
    use { "wakatime/vim-wakatime" }                         -- Time counting and stuff
    use { "ThePrimeagen/git-worktree.nvim" }                -- Worktrees with vim
    use { "vimwiki/vimwiki" }                               -- Vimwiki notes
    use { "dhruvasagar/vim-table-mode" }                    -- Awesome automatic tables
    use { "voldikss/vim-floaterm" }                         -- Floating terminal
    use { "aserowy/tmux.nvim" }                             -- Tmux Integration
    use { "mizlan/iswap.nvim" }                             -- Swap function arguments etc.
    use { "ckarnell/Antonys-macro-repeater" }               -- Repeat macros with `.`
    use { "chrisbra/NrrwRgn", cmd = "NR" }                  -- Open text in other window
    use { "gyim/vim-boxdraw" }                              -- Draw boxes `+o`
    use { "AndrewRadev/splitjoin.vim" }                     -- Split up oneliners `gS` or oneline multiliners `gJ`
    -- TODO: Configure neorg
    use { "nvim-neorg/neorg" }                              -- Neovim orgmode
    use { "mattn/webapi-vim" }                              -- Webapi for backend development
    use { "folke/todo-comments.nvim" }                      -- Highlight comments
    use { "AckslD/nvim-neoclip.lua" }                       -- Clipboard management inside vim
    use {
        "danymat/neogen",
        config = function() require("neogen").setup({}) end
    }                                                       -- Generate Function/Class etc. annotations -> `:lua require("neogen").generate()`
    use {
        "michaelb/sniprun",
        run = "bash ./install.sh"
    }                                                       -- Run code snippets from within vim
    use { "tpope/vim-dadbod" }                              -- Database integration
    use { "kristijanhusak/vim-dadbod-ui" }                  -- Pretty database integration
    use { "NTBBloodbath/rest.nvim" }                        -- Make HTTP rest requests
    -- use { "aquach/vim-http-client" }


    -- New "Verbs"
    use { "numToStr/Comment.nvim" }           -- Comments from treesitter `gc`
    use { "junegunn/vim-easy-align" }         -- Algin `ga`
    use { "godlygeek/tabular" }               -- Tabularize
    use { "vim-scripts/ReplaceWithRegister" } -- Replace without goin into visual mode `gr`
    use { "christoomey/vim-sort-motion" }     -- Sort with `gs`



    -- New "Nouns"
    use { "kana/vim-textobj-user" }           -- For own "Nouns"
    use { "justinmk/vim-sneak" }              -- Sneak motion `s`
    use { "phaazon/hop.nvim" }                -- Easymotion but in lua
    -- use { "justinmk/vim-sneak" }              -- Try to get rid of s and use it for vim-sneak
    use { "michaeljsmith/vim-indent-object" } -- Indent object with ii, ai, aI, and iI etc.
    use { "kana/vim-textobj-entire" }         -- Whole document ae, ie
    use { "wellle/targets.vim" }              -- Many helpful targets


    -- LSP stuff
    use { "neovim/nvim-lspconfig" }                     -- Nvim lsp support
    use { "williamboman/nvim-lsp-installer" }           -- Easy installation for lsp`s
    use { "ThePrimeagen/refactoring.nvim" }             -- Some refactoring tools
    use { "p00f/clangd_extensions.nvim" }               -- Clang extension for nvim-lsp
    use { "hrsh7th/nvim-cmp" }                          -- Autocompletion engine
    use { "hrsh7th/cmp-nvim-lsp" }                      -- Nvim-cmp source for neovim"s built-in ls client
    use { "hrsh7th/cmp-buffer" }                        -- Nvim-cmp source for buffer words
    use { "hrsh7th/cmp-path" }                          -- Nvim-cmp source for filesystem paths
    use { "hrsh7th/cmp-cmdline" }                       -- Nvim-cmp source for vim`s commandline
    use { "hrsh7th/cmp-nvim-lua" }                      -- Nvim lua completion
    use { "onsails/lspkind-nvim" }                      -- Nice Icons in lsp-comp
    use { "saadparwaiz1/cmp_luasnip" }                  -- luasnip support
    use { "rafamadriz/friendly-snippets" }              -- Helpful snippets for popular languages
    use { "tzachar/cmp-tabnine", run = "./install.sh" } -- Nvim-cmp tabnine support

    use { "python-rope/ropevim" }  -- For some Code-actions
    use { "sheerun/vim-polyglot" } -- Collection of language packs


    -- Language specific stuff
    use { "ray-x/go.nvim" }                -- Go
    use { "hdiniz/vim-gradle" }            -- Java Gradle
    use { "ap/vim-css-color" }             -- CSS
    use { "mattn/emmet-vim" }              -- HTML
    use { "neoclide/vim-jsx-improve" }     -- JSX
    use { "lervag/vimtex" }                -- LaTeX
    use { "engeljh/vim-latexfmt" }         -- LaTex Formatter
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }                                      -- Markdown
    -- use { "davidgranstrom/nvim-markdown-preview" } -- Markdown
    use { "OmniSharp/omnisharp-vim" }      -- C#

    -- Debugging
    use { "mfussenegger/nvim-dap" }           -- Debugger Adapter Protocol
    use { "rcarriga/nvim-dap-ui" }            -- UI for DAP
    use { "theHamsta/nvim-dap-virtual-text" } -- Virtual Text support for DAP
    use { "leoluz/nvim-dap-go" }              -- Go debugging


    -- Git
    use { "tpope/vim-fugitive" }      -- Git integration
    use { "lewis6991/gitsigns.nvim" } -- Git signs (gitgutter, Line blame etc.)
    use { "rhysd/committia.vim" }     -- Better commit buffers

    -- Snippets
    use { "L3MON4D3/LuaSnip" } -- Snippet engine with really nice functionalities

    -- Own plugins
    use { "~/code/vim/plugins/soicode.vim" } -- For soi stuff with the .stoml support
    -- use { "~/code/lua/nvim/plugins/soicode.nvim",
    --     rocks = { "lua-toml" },
    --     config = function()
    --         vim.opt.rtp:append(",~/code/lua/nvim/plugins/soicode.nvim")
    --         require("soicode").setup();
    --     end
    -- }


    -- Some would say it"s useless...
    use { "alec-gibson/nvim-tetris" } -- Tetris
    use { "seandewar/nvimesweeper" }  -- Minesweeper
end)
