--          ┌─────────────────────────────────────────────────────────┐
--          │             Initialize Plugin Configuration             │
--          └─────────────────────────────────────────────────────────┘

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
    plugin("colorschemes.catppuccin", "catppuccin/nvim", true),
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
    plugin("treesitter.treesitter-textobjects", "nvim-treesitter/nvim-treesitter-textobjects", true),
}

local editing = {
    plugin("editing.surround", "kylechui/nvim-surround", true),
    plugin("editing.autopairs", "windwp/nvim-autopairs", true),
    plugin("editing.autotag", "windwp/nvim-ts-autotag", true),
    plugin("editing.comment", "numToStr/Comment.nvim", true),
    plugin("editing.comment-box", "LudoPinelli/comment-box.nvim", true),
    plugin("editing.outline", "hedyhli/outline.nvim", true),
    plugin("editing.twilight", "folke/twilight.nvim", true),
    plugin("editing.zen-mode", "folke/zen-mode.nvim", true),
    plugin("editing.in-out", "ysmb-wtsg/in-and-out.nvim", true),
    plugin("editing.codesnap", "mistricky/codesnap.nvim", true),
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
    plugin("code-completion.cmp-lsp-signature", "hrsh7th/cmp-nvim-lsp-signature-help", true),
}

local ui = {
    plugin("ui.dressing", "stevearc/dressing.nvim", true),
    plugin("ui.fidget", "j-hui/fidget.nvim", true),
    plugin("ui.alpha", "goolord/alpha-nvim", true),
    plugin("ui.lualine", "nvim-lualine/lualine.nvim", true),
    plugin("ui.gitsigns", "lewis6991/gitsigns.nvim", true),
    plugin("ui.hover", "lewis6991/hover.nvim", true),
}

local note_taking = {
    plugin("note-taking.obsidian", "epwalsh/obsidian.nvim", true),
    plugin("note-taking.renderer-markdown", "MeanderingProgrammer/render-markdown.nvim", true),
}

local ios_dev = {
    plugin("ios-dev.xcodebuild", "wojciech-kulik/xcodebuild.nvim", true),
}

return { colorschemes, keymapping, navigation, treesitter, editing, lsp, code_completion, ui, note_taking, ios_dev }

