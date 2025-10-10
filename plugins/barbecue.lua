return {
    "BrunoKrugel/bbq.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    config = function()
        local bbq = require("barbecue")
        bbq.setup({
            theme = {
                normal = { link = "@comment" },
            },
        })

        local make_winbar_transparent = function()
            vim.api.nvim_set_hl(0, "WinBar",   { bg = "none", ctermbg = "none" })
            vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none", ctermbg = "none" })

            for _, g in ipairs({
                "BbqWinbar","BbqNormal","BbqContext","BbqSeparator",
                "BbqEllipsis","BbqDirname","BbqBasename","BbqIcon",
                "BbqDim","BbqKind",
            }) do
                vim.api.nvim_set_hl(0, g, { bg = "none", ctermbg = "none" })
            end
        end

        make_winbar_transparent()

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = make_winbar_transparent,
        })
    end,
}
