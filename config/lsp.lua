local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, default_capabilities)
local lspconfig = require("lspconfig")
local venv_lsp = require("venv-lsp")

lspconfig.zls.setup({
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
    workspace_required = false,
})

local clangd_extra_capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
        completion = {
            editsNearCursor = true,
        },
    },
}
local clangd_capabilities = vim.tbl_deep_extend("force", clangd_extra_capabilities, capabilities)
lspconfig.clangd.setup({
    capabilities = clangd_capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
})

lspconfig.pylsp.setup({
    capabilities = capabilities,
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
})

-- lspconfig.pyright.setup({
--     capabilities = capabilities,
--     cmd = { "pyright-langserver", "--stdio" },
--     filetypes = { "python" },
--     root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", ".git"),
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = true,
--                 extraPaths = { "." },
--             },
--         },
--     },
-- })

vim.lsp.enable("zls")
vim.lsp.enable("clangd")
vim.lsp.enable("pylsp")
-- vim.lsp.enable("pyright")

venv_lsp.setup()
