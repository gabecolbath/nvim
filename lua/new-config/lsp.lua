--          ┌─────────────────────────────────────────────────────────┐
--          │                LSP Server Configurations                │
--          └─────────────────────────────────────────────────────────┘
local lsp = require("lspconfig")
local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_lsp.default_capabilities()

-- ──────────────────────────── Global Setup ─────────────────────────
vim.diagnostic.config({
    virtual_text = false,
    float = {
        border = "single",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰬅",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰋖",
        },
    },
})

-- ───────────────────────── Lua Language Server ─────────────────────────
lsp.lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc") then
            return
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {},
    },
    capabilities = capabilities,
    cmd = { mason_path .. "lua-language-server" },
    filetypes = { "lua" },
    log_level = 2,
    root_pattern = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "sylua.toml",
        "selene.toml", "selene.yml", ".git" },
    single_file_support = true,
})

-- ─────────────────────────────── Clangd ────────────────────────────
lsp.clangd.setup({
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = lsp.util.root_pattern(
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
    ),
    single_file_support = true,
})

-- ───────────────────────────────── Zig ─────────────────────────────────
lsp.zls.setup({
    capabilities = capabilities,
    cmd = { mason_path .. "zls" },
    filetypes = { "zig", "zir" },
    root_dir = lsp.util.root_pattern("zls.json", "build.zig", ".git"),
    single_file_support = true,
})
