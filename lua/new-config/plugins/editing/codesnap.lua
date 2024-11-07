--          ┌─────────────────────────────────────────────────────────┐
--          │                 Codesnap Configuration                  │
--          └─────────────────────────────────────────────────────────┘

local build = "make"
local config = function()
    local codesnap = require("codesnap")
    codesnap.setup({
        save_path = "~/Pictures/Screen Shots/",
        has_breadcrumbs = false,
        mac_window_bar = false,
        bg_padding = 0,
        watermark = "",
    })
end

return {
    build = build,
    config = config,
}
