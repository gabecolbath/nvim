--          ┌─────────────────────────────────────────────────────────┐
--          │                Treesitter Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local build = ":TSUpdate"
local config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    })
end

return {
    build = build,
    config = config,
}
