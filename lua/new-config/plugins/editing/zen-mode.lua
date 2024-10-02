--          ┌─────────────────────────────────────────────────────────┐
--          │                 Zen Mode Configuration                  │
--          └─────────────────────────────────────────────────────────┘

local opts = {
    window = {
        backdrop = 0.1,
        width = 0.85,
        height = 0.9,
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
        },
    },
}

return {
    opts = opts,
}
