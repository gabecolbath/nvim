return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
    config = function()
        local mason = require("mason")
        mason.setup({
            ui = {
                border = "single",
            },
        })
    end,
}
