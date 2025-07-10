return {
    "patrickpichler/hovercraft.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local hover = require("hovercraft")

        local lsp_provider = require("hovercraft.provider.lsp.hover")
        local man_provider = require("hovercraft.provider.man")
        local diagnostics_provider = require("hovercraft.provider.diagnostics")

        hover.setup({
            providers = {
                providers = {
                    { "LSP", lsp_provider.new() },
                    { "MAN", man_provider.new() },
                    { "DIAGNOSTICS", diagnostics_provider.new() },
                }
            },
        })
    end,
}
