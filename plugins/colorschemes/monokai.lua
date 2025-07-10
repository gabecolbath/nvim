return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        local monokai = require("monokai-pro")
        monokai.setup({
            transparent_background = true,
            background_clear = {
                "float_win",
                "toggle_term",
                "telescope",
                "which-key",
                "notify",
            }
        })
    end,
}
