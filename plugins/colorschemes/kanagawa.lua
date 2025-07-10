return {
	"rebelot/kanagawa.nvim",
	config = function()
		-- Default options:
		require('kanagawa').setup({
			compile = false,             -- enable compiling the colorscheme
			undercurl = true,            -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true},
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true,         -- do not set background color
			dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
			terminalColors = true,       -- define vim.g.terminal_color_{0,17}
			colors = {                   -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					FloatermBorder = { bg = "none" },
					StatusLine = { bg = "none" },
					MiniFilesTitle = { bg = "none" },
					MiniFilesTitleFocused = { bg = "none" },
					TelescopeBorder = { bg = "none" },
					SignColumn = { bg = "none" },
					LineNr = { bg = "none" },
					CursorLineNr = { bg = "none" },
				}
			end,
			theme = "wave",              -- Load "wave" theme
			background = {               -- map the value of 'background' option to a theme
				dark = "wave",           -- try "dragon" !
				light = "lotus"
			},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme kanagawa")
	end,
}
