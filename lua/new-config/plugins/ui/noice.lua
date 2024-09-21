--          ┌─────────────────────────────────────────────────────────┐
--          │                   Noice Configuration                   │
--          └─────────────────────────────────────────────────────────┘

local event = "VeryLazy"
local dependencies = { "MunifTanjim/nui.nvim" }
local config = function()
    local noice = require("noice")
    noice.setup({
        cmdline = {
            view = "cmdline",
        },
        lsp = {
            signature = {
                enabled = false,
            },
        },
        views = {
            popup = {
                border = { style = "single" },
            },
            hover = {
                border = { style = "single" },
            },
            mini = {
                border = { style = "single" },
            },
            cmdline_popup = {
                border = { style = "single" },
            },
            cmdline_input = {
                border = { style = "single" },
            },
            confirm = {
                border = { style = "single" },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "search_count",
                    },
                    opts = { skip = true },
                },
            },
        },
    })
end

return {
    event = event,
    dependencies = dependencies,
    config = config,
}
