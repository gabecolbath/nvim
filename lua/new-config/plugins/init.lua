local path = "new-config.plugins"

local plugin = function(name, git, enable)
	local status, specs = pcall(require, path .. "." .. name)
	if not enable then
		print(name .. " disabled...")
		return { git, enabled = false }
	end
	if not status then
		print("Failed to load plugin specs for " .. name)
		return git
	end
	local configuration = { git }
	for p_name, spec in pairs(specs) do
		configuration[p_name] = spec
	end
	return configuration
end

local colorschemes = {
	plugin("colorschemes.rose-pine", "rose-pine/neovim", true),
}

local keymapping = {
    plugin("keymapping.which-key", "folke/which-key.nvim", true),
}

local navigation = {
    plugin("navigation.telescope", "nvim-telescope/telescope.nvim", true),
    plugin("navigation.oil", "stevearc/oil.nvim", true),
}

local treesitter = {
    plugin("treesitter.treesitter", "nvim-treesitter/nvim-treesitter", true),
}

local editing = {
    plugin("editing.surround", "kylechui/nvim-surround", true),
    plugin("editing.autopairs", "windwp/nvim-autopairs", true),
    plugin("editing.comment", "numToStr/Comment.nvim", true),
}

local lsp = {
    plugin("lsp.mason", "williamboman/mason.nvim", true),
    plugin("lsp.lspconfig", "neovim/nvim-lspconfig", true),
}

local code_completion = {
    plugin("code-completion.cmp", "hrsh7th/nvim-cmp", true),
    plugin("code-completion.cmp-lsp", "hrsh7th/cmp-nvim-lsp", true),
    plugin("code-completion.cmp-cmdline", "hrsh7th/cmp-cmdline", true),
    plugin("code-completion.cmp-path", "hrsh7th/cmp-path", true),
    plugin("code-completion.luasnip", "L3MON4D3/LuaSnip", true),
}

local ui = {
    plugin("ui.noice", "folke/noice.nvim", true),
    plugin("ui.notify", "rcarriga/nvim-notify", true),
    plugin("ui.alpha", "goolord/alpha-nvim", true),
}

return { colorschemes, keymapping, navigation, treesitter, editing, lsp, code_completion, ui }
