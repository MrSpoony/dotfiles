vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }
    -- Themes
    use { "dylanaraps/wal.vim" } -- Wal theme
    use { "joshdick/onedark.vim" } -- Onedark
    use { "kaicataldo/material.vim" } -- Material
    use { "glepnir/dashboard-nvim" } -- Dashboard when opening neovim
    use { "vim-airline/vim-airline" } -- For nicer bar at the bottom
    use { "vim-airline/vim-airline-themes" } -- Themes for the bar
    use { "windwp/nvim-autopairs" } -- Auto pairinp brackets
    use { "tpope/vim-surround" } -- Surround your stuff easier with brackets or quotes
    use { "kyazdani42/nvim-web-devicons" } -- Icons like the name implies
    use { "romgrk/barbar.nvim" } -- Tab display
    use { "ryanoasis/vim-devicons" } -- Nice Icons
    use { "junegunn/goyo.vim" } -- Distraction free writing
    use { "neovide/neovide" } -- Neovide support


    -- FZF Like useins
    use { "nvim-lua/plenary.nvim" } -- Some helpful lua functions other plugins (telecope) need
    use { "BurntSushi/ripgrep" } -- Line-oriented search tool
    use { "nvim-telescope/telescope.nvim" } -- Telescope search etc.
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "junegunn/fzf", run = "./install --all"}
    use { "junegunn/fzf.vim" }


    -- Other stuff
    use { "tpope/vim-repeat" } -- Repeat commands
    use { "mg979/vim-visual-multi" } -- Multiple cursors
    use { "andweeb/presence.nvim" } -- Discord precense
    use { "wakatime/vim-wakatime" } -- Time counting and stuff
    use { "mbbill/undotree" } -- UndoTree for undo representation
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- TreeSitter for syntax highlighting and code `understanding`
    use { "nvim-treesitter/playground" } -- TreeSitter playground :TSPlaygroundToggle
    use { "vimwiki/vimwiki" } -- Vimwiki notes
    use { "dhruvasagar/vim-table-mode" } -- Awesome automatic tables
    use { "voldikss/vim-floaterm" } -- Floating terminal
    use { "christoomey/vim-tmux-navigator" } -- Integration with Tmux
    use { "vim-scripts/ZoomWin" } -- Zoom in on windows
    use { "kana/vim-textobj-user" } -- For own "Nouns"
    use { "mizlan/iswap.nvim" } -- Swap function arguments etc.
    use { "ckarnell/Antonys-macro-repeater" } -- Repeat macros with `.`
    use { "tpope/vim-eunuch" } -- Useful UNIX commands


    -- New "Verbs"
    use { "numToStr/Comment.nvim" } -- Comments from treesitter gc
    use { "junegunn/vim-easy-align" } -- Algin stuff ga
    use { "vim-scripts/ReplaceWithRegister" } -- Replace without going into visual mode gr
    use { "christoomey/vim-sort-motion" } -- Sort with gs


    -- New "Nouns"
    use { "phaazon/hop.nvim" } -- Easymotion but in lua
    use { "justinmk/vim-sneak" } -- Try to get rid of s and use it for vim-sneak
    use { "michaeljsmith/vim-indent-object" } -- Indent object with ii, ai, aI, and iI etc.
    use { "nvim-treesitter/nvim-treesitter-textobjects" } -- Treesitter textobjects f (functions), etc
    use { "RRethy/nvim-treesitter-textsubjects" } -- Smart textsubjects from treesitter
    use { "kana/vim-textobj-entire" } -- Whole document ae, ie


    -- Autocompletion stuff
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
    use { "tzachar/cmp-tabnine", run = "./install.sh"} -- Nvim-cmp tabnine support


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

    -- Debugger
    -- use { "idanarye/vim-vebugger" }
    use { "cpiger/NeoDebug" } -- Debugging stuff
    -- use { "puremourning/vimspector" }
    use { "sakhnik/nvim-gdb", run = ":!.install.sh" } -- Gdb implementation in neovim
    -- use { "Pocco81/DAPInstall.nvim" }
    -- use { "mfussenegger/nvim-dap" }
    -- use { "rcarriga/nvim-dap-ui" }

    -- Git
    use { "tpope/vim-fugitive" } -- The best Git integration
    use { "airblade/vim-gitgutter" } -- See changes etc. at the left of the buffer

    -- Snippets
    use { "honza/vim-snippets" } -- Requirement of ultisnips
    use { "SirVer/ultisnips" } -- The best ones

    -- Own plugins
    use { "MrSpoony/soicode.vim" } -- For soi stuff with the .stoml support
end)
