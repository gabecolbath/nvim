--          ┌─────────────────────────────────────────────────────────┐
--          │                LSP Config Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local config = function()
    local windows = require("lspconfig.ui.windows")
    windows.default_options.border = "single"
end

return {
    config = config,
}
