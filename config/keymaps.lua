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
    {
        { "<leader>b", group = "buffer" },
        { "<leader>bq", ":bwipeout<cr>", desc = "Close Buffer" },
    },
}

-- local hover = function()
--     local hovercraft = require("hovercraft")
--
--     local next_or_enter = function()
--         if hovercraft.is_visible() then
--             hovercraft.hover_next()
--         else
--             hovercraft.hover()
--         end
--     end
--
--     local enter_if_visible = function()
--         if hovercraft.is_visible() then
--             hovercraft.enter_popup()
--         end
--     end
--
--     return {
--         mode = { "n" },
--         { "K", next_or_enter, desc = "Hover" },
--         { "gK", enter_if_visible, desc = "Enter Hover" },
--     }
-- end

local completion  = function()
    local map_only_on_completion_menu = function(mapping, fallback)
        if vim.fn.pumvisible() then
            return mapping
        else
            return fallback
        end
    end

    return {
        mode = { "i" },
        { "<C-j>", map_only_on_completion_menu("<C-n>", "<C-j>"), desc = "Select Next Completion Item" },
        { "<C-k>", map_only_on_completion_menu("<C-p>", "<C-k>"), desc = "Select Previous Completion Item" },
        { "<C-l>", map_only_on_completion_menu("<C-y>", "<C-l>"), desc = "Expand Selected Completion Item" },
        { "<C-h>", map_only_on_completion_menu("<C-e>", "<C-h>"), desc = "Cancel Completion" },
    }
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local ok, hovercraft = pcall(require, "hovercraft")

        local hover_or_next = function()
            if hovercraft.is_visible() then
                hovercraft.hover_next()
            else
                hovercraft.hover()
            end
        end

        local enter_hover_if_visable = function()
            if hovercraft.is_visible() then
                hovercraft.enter_popup()
            end
        end

        if ok then
            vim.keymap.set("n", "K", hover_or_next, { buffer = args.buf, desc = "LSP Hover" })
            vim.keymap.set("n", "gK", enter_hover_if_visable, { buffer = args.buf, desc = "LSP Enter Hover" })
        else
            vim.keymap.set("n", "K", function() print("No hover available.") end, { buffer = args.buf, desc = "LSP Hover" })
            vim.keymap.set("n", "gK", function() print("No hover available.") end, { buffer = args.buf, desc = "LSP Enter Hover" })
            vim.lsp.buf.hover()
        end
    end,
})

local wk = require("which-key")
wk.add(keymaps)
wk.add(completion())
wk.setup({})
