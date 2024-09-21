--          ┌─────────────────────────────────────────────────────────┐
--          │                 Which Key Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local event = "VeryLazy"
local dependencies = { "nvim-tree/nvim-web-devicons" }
local opts = {
    preset = "modern",
    sort = { "alphanum", "case", "local", "order", "mod" },
    win = {
        border = "single",
    },
}

return {
    event = event,
    dependencies = dependencies,
    opts = opts,
}
