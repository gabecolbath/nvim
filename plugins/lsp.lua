return {
    {
        -- nvim-lspconfig
        "https://github.com/neovim/nvim-lspconfig",
    },

    {
        -- mason.nvim
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },

    {
        -- mason-lspconfig.nvim
        "mason-org/mason-lspconfig.nvim",
    },
}
