return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				RRGGBBAA = true,
				css = true,
				css_fn = true,
				mode = "virtualtext",
				virtualtext_inline = "before",
			}
		})
	end,
}

