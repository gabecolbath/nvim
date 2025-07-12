local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, default_capabilities)

local lspconfig = require("lspconfig")

lspconfig.zls.setup({
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
    workspace_required = false,
})

vim.lsp.enable("zls")
