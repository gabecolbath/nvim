--          ┌─────────────────────────────────────────────────────────┐
--          │                    Oil Configuration                    │
--          └─────────────────────────────────────────────────────────┘

local dependencies = { "echasnovski/mini.icons" }
local opts = {
    skip_confirm_for_simple_edits = true,
    float = {
        padding = 10,
        border = "single",
        preview_split = "right",
    },
    preview = {
        border = "single",
    },
    progress = {
        border = "single",
    },
    ssh = {
        border = "single",
    },
    keymaps_help = {
        border = "single",
    },
}

return {
    dependencies = dependencies,
    opts = opts,
}
