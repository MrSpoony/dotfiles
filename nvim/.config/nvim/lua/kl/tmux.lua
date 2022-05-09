local tmux = require("tmux")

tmux.setup({
    copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = true,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        ignore_buffers = { empty = false },

        -- TMUX >= 3.2: yanks (and deletes) will get redirected to system
        -- clipboard by tmux
        redirect_to_clipboard = true,

        -- offset controls where register sync starts
        -- e.g. offset 2 lets registers 0 and 1 untouched
        register_offset = 0,

        -- sync clipboard overwrites vim.g.clipboard to handle * and +
        -- registers. If you sync your system clipboard without tmux, disable
        -- this option!
        sync_clipboard = true,

        -- syncs deletes with tmux clipboard as well, it is adviced to
        -- do so. Nvim does not allow syncing registers 0 and 1 without
        -- overwriting the unnamed register. Thus, ddp would not be possible.
        sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        sync_unnamed = true,
    },
    navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
    },
    resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = false,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
    }
})


Nnoremap("<C-j>",   tmux.move_bottom)
Nnoremap("<C-k>",   tmux.move_top)
Nnoremap("<C-h>",   tmux.move_left)
Nnoremap("<C-l>",   tmux.move_right)

Nnoremap("<Up>",    tmux.resize_top)
Nnoremap("<Down>",  tmux.resize_bottom)
Nnoremap("<Left>",  tmux.resize_left)
Nnoremap("<Right>", tmux.resize_right)

Nnoremap("<M-j>",   tmux.resize_top)
Nnoremap("<M-k>",   tmux.resize_bottom)
Nnoremap("<M-h>",   tmux.resize_left)
Nnoremap("<M-l>",   tmux.resize_right)
