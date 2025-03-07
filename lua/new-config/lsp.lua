--          ┌─────────────────────────────────────────────────────────┐
--          │                LSP Server Configurations                │
--          └─────────────────────────────────────────────────────────┘
local lsp = require("lspconfig")
local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"
local cmp_lsp = require("cmp_nvim_lsp")

local default_capabilities = cmp_lsp.default_capabilities()

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
    capabilities = default_capabilities,
    cmd = { mason_path .. "lua-language-server" },
    filetypes = { "lua" },
    log_level = 2,
    root_pattern = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "sylua.toml",
        "selene.toml", "selene.yml", ".git" },
    single_file_support = true,
})

-- ─────────────────────────────── Clangd ────────────────────────────
lsp.clangd.setup({
    capabilities = default_capabilities,
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
    capabilities = default_capabilities,
    cmd = { "/opt/zls-0.14.0/zig-out/bin/zls" },
    filetypes = { "zig", "zir" },
    root_dir = lsp.util.root_pattern("zls.json", "build.zig", ".git"),
    single_file_support = true,
})

-- ──────────────────────────────── HTML ─────────────────────────────
local html_capabilities = default_capabilities
html_capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.html.setup({
    capabilities = default_capabilities,
    cmd = { mason_path .. "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
        provideFormatter = true,
    },
})

-- ──────────────────────────────── htmx ─────────────────────────────
lsp.htmx.setup({
    capabilities = default_capabilities,
    cmd = { mason_path .. "htmx-lsp" },
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" },
    single_file_support = true, 
})
