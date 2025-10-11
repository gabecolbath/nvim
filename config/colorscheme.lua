local rose_pine = require("rose-pine")

rose_pine.setup({
    styles = {
        transparency = true,
    },
    highlight_groups = {
        Winbar = { link = "Normal" },
        WinbarNC = { link = "NormalNC" },
        MiniTablineCurrent = { fg = "base", bg = "pine" },
        MiniTablineModifiedCurrent = { fg = "base", bg = "foam" },
        MiniTablineVisible = { link = "@comment.note" },
        MiniTablineModifiedVisible = { link = "@comment.info" },
        MiniTablineHidden = { link = "@comment.note" },
        MiniTablineModifiedHidden = { link = "@comment.info" },
        MiniStatuslineFileInfo = { bg = "none", ctermbg = "none" },
        MiniStatuslineFilename = { bg = "none", ctermbg = "none", italic = true },
        MiniStatuslineDevinfo = { bg = "none", ctermbg = "none" },
        MiniStatuslineModeNormal = { link = "@comment.note" },
        MiniStatuslineModeInsert = { link = "@comment.info" },
        MiniStatuslineModeCommand = { link = "@comment.error" },
        MiniStatuslineModeVisual = { link = "@comment.hint" },
        MiniStatuslineModeReplace = { link = "@comment.warning" },
        MiniSatuslineModeOther = { link = "@comment.todo" },
    }
})

vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "Pmenu" })

vim.cmd("colorscheme rose-pine")

