local run = require("sniprun")

run.setup({
    display = {
        "Classic", --# display results in the command-line  area
        -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

        -- "VirtualTextErr",          --# display error results as virtual text
        -- "TempFloatingWindow",      --# display results in a floating window
        -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
        -- "Terminal",                --# display results in a vertical split
        -- "TerminalWithCode",        --# display results and code history in a vertical split
        "NvimNotify",              --# display with the nvim-notify plugin
        -- "Api"                      --# return output to a programming interface
    },

    display_options = {
        terminal_width = 45, --# change the terminal display option width
        notification_timeout = 5 --# timeout for nvim_notify output
    },

    --# You can use the same keys to customize whether a sniprun producing
    --# no output should display nothing or '(no output)'
    show_no_output = {
        "Classic",
        "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
    },

    --# customize highlight groups (setting this overrides colorscheme)
    snipruncolors = {
        SniprunVirtualTextOk  = { bg = "#66eeff", fg = "#000000", ctermbg = "Cyan", cterfg = "Black" },
        SniprunFloatingWinOk  = { fg = "#66eeff", ctermfg = "Cyan" },
        SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
        SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
    },

    --# miscellaneous compatibility/adjustement settings
    inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages
    --# to workaround sniprun not being able to display anything

    borders = 'single', --# display borders around floating windows
    --# possible values are 'none', 'single', 'double', or 'shadow'
    live_mode_toggle = 'off' --# live mode toggle, see Usage - Running for more info
})

Vnoremap("t", "<Plug>SnipRun")
Nnoremap("<leader><leader>r", "<cmd>SnipRunOperator<cr>")
Nnoremap("<leader><leader>n", "<cmd>SnipRun<cr>")
