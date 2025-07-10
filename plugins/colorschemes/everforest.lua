return {
	"neanias/everforest-nvim",
	enable = false,
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({})
	end,
}
