
--  888      .d8888b.  8888888b.  
--  888     d88P  Y88b 888   Y88b 
--  888     Y88b.      888    888 
--  888      "Y888b.   888   d88P 
--  888         "Y88b. 8888888P"  
--  888           "888 888        
--  888     Y88b  d88P 888        
--  88888888 "Y8888P"  888        

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local mason_path = vim.fn.stdpath("data") .. "/mason/bin"

local capabilities = cmp_nvim_lsp.default_capabilities()
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = false,
    }),
    ["textDocment/implementation"] = vim.lsp.with(vim.lsp.handlers["textDocument/implementation"], {
        border = "single",
    }),
    ["textDocument/completion"] = vim.lsp.with(vim.lsp.handlers["textDocument/completion"], {
        border = "single",
    }),
}
-- Lua ------------------------------------------------------------------------
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    handlers = handlers,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', --version of Lua to use
                path = vim.fn.stdpath("data") .. "/mason/bin",
            },
            diagnostics = {
                globals = { 'vim', 'use', 's', 'sn', 'i', 'rep', 'c', 'd', 'f', 't', 'fmta', 'fmt' },
                ignoredFiles = "Opened",
            },
            workspace = {
                maxPreload = 11,
                preloadFileSize = 10,
                -- Make the server aware of Neovim runtime files
                library = {
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                },
                ignoreDir = { "main/", "lua/" }
            },
        },
    },
})

-- CLangd ---------------------------------------------------------------------
lspconfig.clangd.setup({
    capabilities = capabilities,
    handlers = handlers,
    cmd = { "clangd" },
    path = vim.fn.stdpath("data") .. "/mason/bin",
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "procto" },
    root_dir = lspconfig.util.root_pattern(
        ".clangd",
        ".clang-tidy", 
        ".clang-format",
        ".compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
    ),
    single_file_support = true,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
    handlers = handlers,
})

-- Zig -----------------------------------------------------------------------
lspconfig.zls.setup({
    capabilities = capabilities,
    handlers = handlers,
    cmd = { "zls" },
    path = { mason_path },
    filetypes = { "zig", "zir" },
    root_dir = lspconfig.util.root_pattern(
        "zls.json", 
        "build.zig",
        ".git"
    ),
    single_file_support = true,
})

-- Python --------------------------------------------------------------------
lspconfig.pyright.setup({
    capabilities = capabilities,
    handlers = handlers,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
    single_file_support = true,
})

-- Swift ----------------------------------------------------------------------
lspconfig.sourcekit.setup({
    capabilities = capabilities,
    handlers = handlers,
    cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
    filetypes = { "swift" },
    root_dir = lspconfig.util.root_pattern(
        "buildServer.json",
        "*.xcodeproj",
        ".xcworkspace",
        ".git",
        "compile_commands.json",
        "Package.swift"
    )
})

-- Verilog --------------------------------------------------------------------
local root_pattern = lspconfig.util.root_pattern("veridian.yml", ".git")
lspconfig.veridian.setup {
    cmd = { 'veridian' },
    root_dir = function(fname)
        local filename = lspconfig.path.is_absolute(fname) and fname
            or lspconfig.util.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename) or lspconfig.util.path.dirname(filename)
    end,
}
