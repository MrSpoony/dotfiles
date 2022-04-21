vim.cmd([[packadd packer.nvim]])


return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- Dependencies for others
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- TreeSitter for syntax highlighting and code `understanding`
    use { "nvim-lua/popup.nvim" } -- Popups in Neovim
    use { "nvim-lua/plenary.nvim" } -- Some helpful lua functions other plugins (telecope) need
    use { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } } -- Store stuff in sqlite database for more spee;d


    -- UI
    -- Themes:
    use { "dylanaraps/wal.vim" } -- Wal
    use { "Mofiqul/dracula.nvim" } -- Dracula
    use { "marko-cerovac/material.nvim" } -- Material
    use { "navarasu/onedark.nvim" } -- Onedark
    use { "ChristianChiarulli/nvcode-color-schemes.vim" } -- Multiple themes
    use { "SmiteshP/nvim-gps" } -- Location widget in lualine
    use { "nvim-lualine/lualine.nvim" } -- Line at the bottom
    use { "justinmk/vim-syntax-extra" } -- Extra syntax
    use { "mhinz/vim-startify" } -- Fancy startup screen `:h startify` `:h startify-faq`
    use { "tpope/vim-obsession" } -- Session management
    use { "windwp/nvim-autopairs" } -- Auto pairinp brackets
    use { "tpope/vim-surround" } -- Surround your stuff easier with brackets or quotes
    use { "romgrk/barbar.nvim" } -- Tab display
    use { "kyazdani42/nvim-web-devicons" } -- Icons like the name implies
    use { "junegunn/goyo.vim" } -- Distraction free writing
    use { "junegunn/limelight.vim" } -- Beautify goyo
    use { "neovide/neovide" } -- Neovide support

    -- TODO: Comment plugins
    use { "milisims/nvim-luaref" }
    use { "nanotee/luv-vimdocs" }


    use { "BurntSushi/ripgrep" } -- Line-oriented search tool
    use { "nvim-telescope/telescope.nvim" } -- Telescope search etc.
    use { "jvgrootveld/telescope-zoxide" } -- Like z command
    use { "nvim-telescope/telescope-packer.nvim" } -- Packer plugins
    use { "nvim-telescope/telescope-symbols.nvim" } -- Symbols
    use {
        "nvim-telescope/telescope-fzf-native.nvim", run = "make"
    } -- FZF Performance and syntax
    use { "nvim-telescope/telescope-file-browser.nvim" } -- File browser
    use { "nvim-telescope/telescope-ui-select.nvim" } -- Use floating ui for codeactions
    use { "nvim-telescope/telescope-smart-history.nvim" } -- Store search history in sqlite database
    use { "nvim-telescope/telescope-frecency.nvim" } -- Frequently visited files
    use { "nvim-telescope/telescope-cheat.nvim" } -- Cheat.sh
    use { "junegunn/fzf", run = "./install -- all" } -- FZF
    use { "junegunn/fzf.vim" } -- FZF in vim


    -- Other stuff
    use { "tpope/vim-repeat" } -- Repeat commands
    use { "mg979/vim-visual-multi" } -- Multiple cursors
    use { "andweeb/presence.nvim" } -- Discord precense
    use { "wakatime/vim-wakatime" } -- Time counting and stuff
    use { "mbbill/undotree" } -- Undo representation
    use { "kyazdani42/nvim-tree.lua" } -- File structure
    use { "vimwiki/vimwiki" } -- Vimwiki notes
    use { "dhruvasagar/vim-table-mode" } -- Awesome automatic tables
    use { "voldikss/vim-floaterm" } -- Floating terminal
    use { "christoomey/vim-tmux-navigator" } -- Integration with Tmux
    use { "vim-scripts/ZoomWin" } -- Zoom in on windows
    use { "kana/vim-textobj-user" } -- For own "Nouns"
    use { "mizlan/iswap.nvim" } -- Swap function arguments etc.
    use { "ckarnell/Antonys-macro-repeater" } -- Repeat macros with `.`
    use { "tpope/vim-eunuch" } -- Useful UNIX commands
    use {
        "danymat/neogen", config = function() require("neogen").setup({}) end
    } -- Generate Function/Class etc. annotations -> `:lua require("neogen").generate()`
    use { "chrisbra/NrrwRgn", cmd = "NR" } -- Open text in other window
    use { "gyim/vim-boxdraw" } -- Draw boxes `+o`
    use { "tpope/vim-abolish" } -- Abbreviations, Substitutions `:S` and Coercion `cr{s,m,_,u,U}`
    use { "AndrewRadev/splitjoin.vim" } -- Split up oneliners `gS` or oneline multiliners `gJ`
    -- TODO: Configure neorg
    use { "nvim-neorg/neorg" }

    -- New "Verbs"
    use { "numToStr/Comment.nvim" } -- Comments from treesitter `gc`
    use { "junegunn/vim-easy-align" } -- Algin `ga`
    use { "godlygeek/tabular" } -- Tabularize
    use { "vim-scripts/ReplaceWithRegister" } -- Replace without going into visual mode `gr`
    use { "christoomey/vim-sort-motion" } -- Sort with `gs`
    use { "nvim-treesitter/playground" } -- TreeSitter playground :TSPlaygroundToggle
    use { "nvim-treesitter/nvim-treesitter-refactor" } -- Refactoring tools



    -- New "Nouns"
    use { "phaazon/hop.nvim" } -- Easymotion but in lua
    -- use { "justinmk/vim-sneak" } -- Try to get rid of s and use it for vim-sneak
    use { "michaeljsmith/vim-indent-object" } -- Indent object with ii, ai, aI, and iI etc.
    use { "kana/vim-textobj-entire" } -- Whole document ae, ie


    use { "nvim-treesitter/nvim-treesitter-textobjects" } -- Treesitter textobjects f (functions), etc
    use { "RRethy/nvim-treesitter-textsubjects" } -- Smart textsubjects from treesitter
    use { "p00f/nvim-ts-rainbow" } -- Rainbow brackets from treesitter


    -- LSP stuff
    -- TODO: Configure null-ls
    -- use { "jose-elias-alvarez/null-ls.nvim" }           -- Inject stuff into LSP communication
    use { "neovim/nvim-lspconfig" } -- Nvim lsp support
    use { "williamboman/nvim-lsp-installer" } -- Easy installation for lsp`s
    use { "ThePrimeagen/refactoring.nvim" } -- Some refactoring tools
    use { "p00f/clangd_extensions.nvim" } -- Clang extension for nvim-lsp
    use { "hrsh7th/nvim-cmp" } -- Autocompletion engine
    use { "hrsh7th/cmp-nvim-lsp" } -- Nvim-cmp source for neovim"s built-in ls client
    use { "hrsh7th/cmp-buffer" } -- Nvim-cmp source for buffer words
    use { "hrsh7th/cmp-path" } -- Nvim-cmp source for filesystem paths
    use { "hrsh7th/cmp-cmdline" } -- Nvim-cmp source for vim`s commandline
    use { "onsails/lspkind-nvim" } -- Nice Icons in lsp-comp
    use { "saadparwaiz1/cmp_luasnip" } -- luasnip support
    use { "rafamadriz/friendly-snippets" } -- Helpful snippets for popular languages
    use { "tzachar/cmp-tabnine", run = "./install.sh" } -- Nvim-cmp tabnine support


    use { "python-rope/ropevim" } -- For some Code-actions
    use { "sheerun/vim-polyglot" } -- Collection of language packs


    -- Language specific stuff
    use { "hdiniz/vim-gradle" } -- Java Gradle
    use { "ap/vim-css-color" } -- CSS
    use { "mattn/emmet-vim" } -- HTML
    use { "rstacruz/sparkup" } -- Even better HTML
    use { "neoclide/vim-jsx-improve" } -- For JSX
    use { "lervag/vimtex" } -- LaTeX
    use { "engeljh/vim-latexfmt" } -- LaTex Formatter
    use { "iamcco/markdown-preview.nvim" } -- Markdown
    use { "OmniSharp/omnisharp-vim" } -- C#

    -- TODO: Debugger


    -- Git
    use { "tpope/vim-fugitive" } -- Git integration
    use { "rhysd/committia.vim" } -- Better commit buffers
    use { "lewis6991/gitsigns.nvim" } -- Git signs (gitgutter, Line blame etc.)

    -- Snippets
    -- use { "honza/vim-snippets" }      -- Requirement of ultisnips
    -- use { "SirVer/ultisnips" }        -- The best ones
    use { "L3MON4D3/LuaSnip" }

    -- Own plugins
    use { "MrSpoony/soicode.vim" } -- For soi stuff with the .stoml support


    -- Some would say it"s useless...
    use { "alec-gibson/nvim-tetris" } -- Tetris in Neovim
end)
