--          ┌─────────────────────────────────────────────────────────┐
--          │                  Fidget Configuration                   │
--          └─────────────────────────────────────────────────────────┘

local opts = {
    progress = {
        display = {
            done_icon = "",
        },
    },
    notification = {
        filter = vim.log.levels.DEBUG,
        override_vim_notify = true,
        window = {
            border = "single",
            winblend = 0,
        },
    },
}

return {
    opts = opts,
}
