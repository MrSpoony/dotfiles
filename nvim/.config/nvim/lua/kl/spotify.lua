local spotify = require("nvim-spotify")

spotify.setup({
    status = {
        update_interval = 5000,
        format = "%s %p %t - %a"
    }
})
