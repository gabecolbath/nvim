--          ┌─────────────────────────────────────────────────────────┐
--          │                Treesitter Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local build = ":TSUpdate"
local config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },
        sync_install = false,
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    })
end

return {
    build = build,
    config = config,
}
