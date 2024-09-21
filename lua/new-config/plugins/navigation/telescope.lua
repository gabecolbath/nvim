--          ┌─────────────────────────────────────────────────────────┐
--          │                 Telescope Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local tag = "0.1.8"
local dependencies = { "nvim-lua/plenary.nvim" }
local opts = {
    defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
}

return {
    tag = tag,
    dependencies = dependencies,
    opts = opts,
}
