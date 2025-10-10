local rose_pine = require("rose-pine")

rose_pine.setup({
    styles = {
        transparency = true,
    },
    highlight_groups = {
        MiniTablineCurrent = { fg = "base", bg = "pine" },
        MiniTablineModifiedCurrent = { fg = "base", bg = "foam" },
        MiniTablineVisible = { link = "@comment.note" },
        MiniTablineModifiedVisible = { link = "@comment.info" },
        MiniTablineHidden = { link = "@comment.note" },
        MiniTablineModifiedHidden = { link = "@comment.info" },
    }
})

vim.cmd("colorscheme rose-pine")
