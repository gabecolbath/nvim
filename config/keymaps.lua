local keymaps = {
    { "<leader>e", ":lua MiniFiles.open()<cr>", desc = "File Explorer" },
    {
        { "<leader>f", group = "find" },
        { "<leader>ff", ":lua MiniPick.builtin.files()<cr>", desc = "Files" },
        { "<leader>fb", ":lua MiniPick.builtin.buffers()<cr>", desc = "Buffers" },
        {
            { "<leader>fs", group = "symbols" },
            { "<leader>fss", ":Namu symbols<cr>", desc = "Symbols in current buffer" },
            { "<leader>fsb", ":Namu watchtower<cr>", desc = "Symbols in open buffers" },
            { "<leader>fsw", ":Namu workspace<cr>", desc = "Symbols in workspace" },
        },
        {
            { "<leader>fc", group = "call" },
            { "<leader>fcc", ":Namu call both<cr>", desc = "Call hierarchy for symbol both in and out." },
            { "<leader>fci", ":Namu call in<cr>", desc = "Call hierarchy for symbol in" },
            { "<leader>fco", ":Namu call out<cr>", desc = "Call hierarchy for symbol out" },
        },
    },
    { "<leader>m", ":lua MiniMap.toggle()<cr>", desc = "Map" },
    {
        { "<leader>t", group = "trim" },
        { "<leader>tt", ":lua MiniTrailspace.trim()<cr>", desc = "Trailing Whitespace" },
        { "<leader>tT", ":lua MiniTrailspace.trim_last_lines()<cr>", desc = "Trailing Empty Lines" }
    },
}

local hover = function()
    local hovercraft = require("hovercraft")

    local next_or_enter = function()
        if hovercraft.is_visible() then
            hovercraft.hover_next()
        else
            hovercraft.hover()
        end
    end

    local enter_if_visible = function()
        if hovercraft.is_visible() then
            hovercraft.enter_popup()
        end
    end

    return {
        { "K", next_or_enter, desc = "Hover" },
        { "gK", enter_if_visible, desc = "Enter Hover" },
    }
end

local wk = require("which-key")
wk.add(keymaps)
wk.add(hover())
wk.setup({})
