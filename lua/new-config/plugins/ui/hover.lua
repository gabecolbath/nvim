--          ┌─────────────────────────────────────────────────────────┐
--          │                Hovercraft Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local dependencies = { "nvim-lua/plenary.nvim" }
local opts = {
    init = function()
        require("hover.providers.lsp")
        require("hover.providers.gh")
        require("hover.providers.diagnostic")
        require("hover.providers.man")
    end,
    preview_opts = {
        border = "single",
    },
}

return {
    dependencies = dependencies,
    opts = opts,
}
