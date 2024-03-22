
--  888b    888                        888                   
--  8888b   888                        888                   
--  88888b  888                        888                   
--  888Y88b 888  .d88b.   .d88b.   .d88888  .d88b.  888  888 
--  888 Y88b888 d8P  Y8b d88""88b d88" 888 d8P  Y8b 888  888 
--  888  Y88888 88888888 888  888 888  888 88888888 Y88  88P 
--  888   Y8888 Y8b.     Y88..88P Y88b 888 Y8b.      Y8bd8P  
--  888    Y888  "Y8888   "Y88P"   "Y88888  "Y8888    Y88P  

local opts = {
    library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- for your Neovim config directory, the config.library settings will be used as is
    -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
    -- for any other directory, config.library.enabled will be set to false
    override = function(root_dir, options) end,
    -- With lspconfig, Neodev will automatically setup your lua-language-server
    -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
    -- in your lsp start options
    lspconfig = true,
    -- much faster, but needs a recent built of lua-language-server
    -- needs lua-language-server >= 3.6.0
    pathStrict = true,
}

return {
    opts = opts,
}
