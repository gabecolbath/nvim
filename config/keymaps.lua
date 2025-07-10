local keymap = require("which-key")

local lazy = {
	{ "<leader>L", "<cmd>Lazy<cr>", desc = "Open Lazy" },
}

local quit = {
    { "<leader>q", group = "quit" },
	{ "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>q!", "<cmd>q!<cr>", desc = "Force Quit" },
	{ "<leader>qa", "<cmd>qa<cr>", desc = "Quit All" },
}

local write = {
	{ "<leader>w", group = "write" },
	{ "<leader>ww", "<cmd>w<cr>", desc = "Write" },
	{ "<leader>wq", "<cmd>wq<cr>", desc = "Write Quit" },
}

local telescope = {
	{ "<leader>f", group = "find" },
	{ "<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
}

local mini_files = {
	{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Explore Files" },
}

local auto_session = {
	{ "<leader>s", group = "session" },
	{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save Session" },
	{ "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore Session" },
}

local lsp_config = {
    { "<leader>l", group = "Lsp" },
    { "<leader>lM", "<cmd>Mason<cr>", desc = "Open Mason" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
}

local window = {
    { "<C-h>", "<C-w>h", desc = "Move To Window (Left)" },
    { "<C-j>", "<C-w>j", desc = "Move To Window (Down)"},
    { "<C-k>", "<C-w>k", desc = "Move To Window (Up)" },
    { "<C-l>", "<C-w>l", desc = "Move To Window (Right)" },
}

local hover = function()
    local hovercraft = require("hovercraft")

    local next_or_enter = function()
        if hovercraft.is_visible() then
            hovercraft.hover_next()
        else
            hovercraft.hover()
        end
    end

    local enter_if_visible = function()
        if hovercraft.is_visible() then
            hovercraft.enter_popup()
        end
    end

    return {
        { "K", next_or_enter, desc = "Hover" },
        { "gK", enter_if_visible, desc = "Enter Hover" },
    }
end

local lsp = function(buf)
	return {
		{ "<leader>a", group = "Code Actions", buffer = buf },
		{ "gd", require("telescope.builtin").lsp_deinitions, desc = "Goto Definitions", buffer = buf },
		{ "gr", require("telescope.builtin").lsp_references, desc = "Goto References", buffer = buf },
		{ "gI", require("telescope.builtin").lsp_implementations, desc = "Goto Implementations", buffer = buf },
		{ "<leader>fd", require("telescope.builtin").lsp_type_definitions, desc = "Type Definitions", buffer = buf },
		{ "<leader>fs", require("telescope.builtin").lsp_document_symbols, desc = "Document Symbols", buffer = buf },
		{ "<leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Workspace Symbols", buffer = buf },
		{ "<leader>a", group = "code actions", buffer = buf },
		{ "<leader>ar", vim.lsp.buf.rename, desc = "Rename", buffer = buf },
		{ "<leader>aa", vim.lsp.buf.code_action, desc = "Code Action", buffer = buf },
		{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration", buffer = buf },
	}
end

keymap.add(lazy)
keymap.add(quit)
keymap.add(write)
keymap.add(telescope)
keymap.add(mini_files)
keymap.add(auto_session)
keymap.add(lsp_config)
keymap.add(window)
keymap.add(hover())

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		keymap.add(lsp(event.buf))
	end,
})

