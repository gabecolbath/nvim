local set = vim.opt

set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.relativenumber = true
set.number = true
set.autoindent = true
set.fillchars = "eob: "
set.numberwidth = 4
set.ignorecase = true
set.smartcase = true
set.wrap = false
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"
set.backspace = "indent,eol,start"
set.clipboard:append("unnamedplus")
set.splitright = true
set.splitbelow = true
set.cursorline = true
set.hlsearch = false
set.scrolloff = 10

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text.",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.diagnostic.config({
    underline = false,
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "",
            [vim.diagnostic.severity.INFO]  = "",
        },
    },
})
