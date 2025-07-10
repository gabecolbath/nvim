vim.cmd.colorscheme "rose-pine"

local indent_line = function()
	vim.api.nvim_set_hl(0, "IndentLine", { link = "IblWhitespace" })
	vim.api.nvim_set_hl(0, "IndentLineCurrent", { link = "Conceal" })
end

indent_line()
