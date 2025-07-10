return {
	"nvim-treesitter/nvim-treesitter", 
	dependencies = { "windwp/nvim-ts-autotag" },
	branch = "master", 
	lazy = false,
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { 
				enable = true, 
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },

			ensure_installed = {
				"json",
				"html",
				"css",
				"c",
				"cpp",
				"zig",
				"lua",
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

		
	end,
}
