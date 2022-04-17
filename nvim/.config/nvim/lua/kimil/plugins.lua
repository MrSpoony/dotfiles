vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- Dependencies for others
    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- TreeSitter for syntax highlighting and code `understanding`
    use { "nvim-treesitter/playground" } -- TreeSitter playground :TSPlaygroundToggle
    use { "nvim-lua/popup.nvim" }
    -- Lua stuff
    use { "nvim-lua/plenary.nvim" } -- Some helpful lua functions other plugins (telecope) need
    use { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } }



    -- Theme stuff
    use { "dylanaraps/wal.vim" } -- Wal theme
    use { "Mofiqul/dracula.nvim" } -- Dracula
    use { "marko-cerovac/material.nvim" } -- Material
    use { "navarasu/onedark.nvim" } -- Onedark
    use { "ChristianChiarulli/nvcode-color-schemes.vim" } -- Multiple themes

    use { "SmiteshP/nvim-gps" } -- Location widget in lualine
    use { "nvim-lualine/lualine.nvim" } -- Line at the bottom

    -- use { "joshdick/onedark.vim" } -- Onedark
    -- use { "kaicataldo/material.vim" } -- Material
    use { "justinmk/vim-syntax-extra" } -- Extra syntax
    -- use { "glepnir/dashboard-nvim" } -- Dashboard when opening neovim
    use { "mhinz/vim-startify" } -- Fancy startup screen `:h startify` `:h startify-faq`
    use { "windwp/nvim-autopairs" } -- Auto pairinp brackets
    use { "tpope/vim-surround" } -- Surround your stuff easier with brackets or quotes
    use { "kyazdani42/nvim-web-devicons" } -- Icons like the name implies
    use { "yamatsum/nvim-nonicons" }
    use { "romgrk/barbar.nvim" } -- Tab display
    use { "ryanoasis/vim-devicons" } -- Nice Icons
    use { "junegunn/goyo.vim" } -- Distraction free writing
    use { "neovide/neovide" } -- Neovide support

    -- TODO: Comment plugins
    use { "milisims/nvim-luaref" }
    use { "nanotee/luv-vimdocs" }


    -- TODO: Comment plugins
    use { "BurntSushi/ripgrep" } -- Line-oriented search tool
    use { "nvim-telescope/telescope.nvim" } -- Telescope search etc.
    use { "jvgrootveld/telescope-zoxide" } -- Like z command
    use { "nvim-telescope/telescope-rs.nvim" }
    use { "nvim-telescope/telescope-rs.nvim" }
    use { "nvim-telescope/telescope-fzf-writer.nvim" }
    use { "nvim-telescope/telescope-packer.nvim" }
    use { "nvim-telescope/telescope-symbols.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-hop.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-smart-history.nvim" }
    use { "nvim-telescope/telescope-frecency.nvim" }
    use { "nvim-telescope/telescope-cheat.nvim" }
    use { "nvim-telescope/telescope-arecibo.nvim" }
    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }


    -- Other stuff
    use { "tpope/vim-repeat" } -- Repeat commands
    use { "mg979/vim-visual-multi" } -- Multiple cursors
    use { "andweeb/presence.nvim" } -- Discord precense
    use { "wakatime/vim-wakatime" } -- Time counting and stuff
    use { "mbbill/undotree" } -- UndoTree for undo representation
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
        "danymat/neogen",
        config = function()
            require("neogen").setup({})
        end
    } -- Generate Function/Class etc. annotations -> `:lua require("neogen").generate()`
    use { "chrisbra/NrrwRgn", cmd = "NR" } -- Open text in other window
    use {
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    } -- NeoVim in Browser
    use { "gyim/vim-boxdraw" } -- Draw boxes `+o`
    use { "monaqa/dial.nvim" }
    use { "tpope/vim-abolish" }
    use { "AndrewRadev/splitjoin.vim" }
    -- TODO: Configure neorg
    use { "nvim-neorg/neorg" }


    -- New "Verbs"
    use { "numToStr/Comment.nvim" } -- Comments from treesitter gc
    use { "junegunn/vim-easy-align" } -- Algin stuff ga
    use { "vim-scripts/ReplaceWithRegister" } -- Replace without going into visual mode gr
    use { "christoomey/vim-sort-motion" } -- Sort with gs


    -- New "Nouns"
    use { "phaazon/hop.nvim" } -- Easymotion but in lua
    use { "justinmk/vim-sneak" } -- Try to get rid of s and use it for vim-sneak
    use { "michaeljsmith/vim-indent-object" } -- Indent object with ii, ai, aI, and iI etc.
    use { "kana/vim-textobj-entire" } -- Whole document ae, ie


    use { "nvim-treesitter/nvim-treesitter-textobjects" } -- Treesitter textobjects f (functions), etc
    use { "RRethy/nvim-treesitter-textsubjects" } -- Smart textsubjects from treesitter
    use { "p00f/nvim-ts-rainbow" } -- Rainbow brackets from treesitter


    -- LSP stuff
    -- TODO: Configure null-ls
    use { "jose-elias-alvarez/null-ls.nvim" } -- Inject stuff into LSP communication
    use { "neovim/nvim-lspconfig" } -- Nvim lsp support
    use { "williamboman/nvim-lsp-installer" } -- Easy installation for lsp" s
    use { "p00f/clangd_extensions.nvim" } -- Clang extension for nvim-lsp
    use { "hrsh7th/nvim-cmp" } -- Autocompletion engine
    use { "hrsh7th/cmp-nvim-lsp" } -- Nvim-cmp source for neovim"s built-in ls client
    use { "hrsh7th/cmp-buffer" } -- Nvim-cmp source for buffer words
    use { "hrsh7th/cmp-path" } -- Nvim-cmp source for filesystem paths
    use { "hrsh7th/cmp-cmdline" } -- Nvim-cmp source for vim"s commandline
    use { "onsails/lspkind-nvim" } -- Nice Icons in lsp-comp
    use { "quangnguyen30192/cmp-nvim-ultisnips" } -- Nvim-cmp ultisnips support
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
    -- use { "idanarye/vim-vebugger" }
    use { "cpiger/NeoDebug" } -- Debugging stuff
    -- use { "puremourning/vimspector" }
    use { "sakhnik/nvim-gdb", run = ":!.install.sh" } -- Gdb implementation in neovim
    -- use { "Pocco81/DAPInstall.nvim" }
    -- use { "mfussenegger/nvim-dap" }
    -- use { "rcarriga/nvim-dap-ui" }

    -- Git
    use { "tpope/vim-fugitive" } -- Git integration
    -- TODO: Configure neogit and gitsigns
    use { "TimUntersberger/neogit" } -- Magit in Vim
    use { "rhysd/committia.vim" } -- Better commit buffers
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    } -- Git signs (gitgutter, Line blame etc.)

    -- Snippets
    use { "honza/vim-snippets" } -- Requirement of ultisnips
    use { "SirVer/ultisnips" } -- The best ones

    -- Own plugins
    use { "MrSpoony/soicode.vim" } -- For soi stuff with the .stoml support


    -- Other
    use { "alec-gibson/nvim-tetris" } -- Tetris in Neovim

end)
