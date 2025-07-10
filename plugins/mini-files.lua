return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "L",
				synchronize = "=",
			},
		})
	end,
}
