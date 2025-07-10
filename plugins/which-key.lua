return {
	"folke/which-key.nvim",
    config = function()
        local which_key = require("which-key")
        which_key.setup({
            present = "modern",
            sort = { "alphanum", "case", "local", "order", "mod" },
            win = {
                border = "single",
            },
        })
    end,
}
