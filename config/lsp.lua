require("mason-lspconfig").setup({})

local capabilities = require("mini.completion").get_lsp_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("zls", {
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig", ".git" },
    workspace_required = false,
})

vim.lsp.config("basedpyright", {
    capabilities = capabilities,
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            }
        },
    },
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "obcpp" },
    root_markers = { ".git" },
})

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
})

vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html" },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        if fname == '' then return end
        on_dir(vim.fs.dirname(fname))
    end,
    workspace_required = false,
})

vim.lsp.enable("lua_ls", true)
vim.lsp.enable("zls", true)
vim.lsp.enable("basedpyright", true)
vim.lsp.enable("clangd", true)
vim.lsp.enable("rust_analyzer", true)
vim.lsp.enable("html", true)
