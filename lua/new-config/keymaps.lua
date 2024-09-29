--          ┌─────────────────────────────────────────────────────────┐
--          │                     Config Keymaps                      │
--          └─────────────────────────────────────────────────────────┘

local wk = require("which-key")
local extras = require("which-key.extras")

-- ────────────────────────────── Obsidian ───────────────────────────
wk.add({
    { "<leader>n", group = "notes" },
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New" },         --TODO change to .md only
    { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open" },       --TODO change to .md only
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search" },   --TODO change to .md only
    { "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Rename" },   --TODO change to .md only
})

-- ────────────────────────── Window Navigation ──────────────────────────
wk.add({
    { "<C-j>", "<C-w>j", desc = "Window Down" },
    { "<C-k>", "<C-w>k", desc = "Window Up" },
    { "<C-h>", "<C-w>h", desc = "Window Left" },
    { "<C-l>", "<C-w>l", desc = "Window Right" },
})

-- ─────────────────────────────── Outline ───────────────────────────────
wk.add({
    { "<leader>o", "<cmd>Outline!<cr>", desc = "Toggle Outline" },
})

-- ─────────────────────────────── Buffer ────────────────────────────
wk.add({
    { "<leader>b", group = "buffer" },
    { "<leader>bc", "<cmd>bd<cr>", desc = "Close" },
    { "<leader>bfc", "<cmd>bd!<cr>", desc = "Force Close" },
    { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer" },
    { "<leader>bg", group = "go to", expand = function()
        return extras.expand.buf()
    end
    },
})

-- ──────────────────────────────── Lazy ─────────────────────────────
wk.add({
    { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
})

-- ──────────────────────────────── Mason ────────────────────────────────
wk.add({
    { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
})

-- ────────────────────────────── Messages ───────────────────────────
wk.add({
    { "<leader>m", "<cmd>messages<cr>", desc = "Messages" },
})

wk.add({
    { "<leader>l", group = "lsp" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart" },
})

-- ────────────────────────────── Telescope ──────────────────────────────
wk.add({
    { "<leader>f", group = "file" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
})

-- ───────────────────────────────── Oil ─────────────────────────────────
wk.add({
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "File Explorer" },
})

-- ───────────────────────────────── CMP ─────────────────────────────────
-- ┌
-- │ See cmp configuration                                   
-- └                                                          

-- ───────────────────────────── Comment Box ─────────────────────────────
wk.add({
    mode = { "n", "v" },
    { "<leader>c", group = "comment" },
    { "<leader>cc", "<cmd>CBcatalog<cr>", desc = "Catalog" },
    { "<leader>cd", "<cmd>CBd<cr>", desc = "delete" },
    { "<leader>cy", "<cmd>CBy<cr>", desc = "yank" },

    { "<leader>cb", group = "box" },
    { "<leader>cbb", "<cmd>CBccbox2<cr>", desc = "Center" },
    { "<leader>cbl", "<cmd>CBclbox2<cr>", desc = "Left" },
    { "<leader>cbr", "<cmd>CBcrbox2<cr>", desc = "Right" },
    { "<leader>cbq", "<cmd>CBllbox12<cr>", desc = "Quote" },

    { "<leader>cl", group = "line" },
    { "<leader>cll", "<cmd>CBline<cr>", desc = "Line" },
    { "<leader>clt", group = "title" },
    { "<leader>cltt", "<cmd>CBlcline1<cr>", desc = "Center" },
    { "<leader>cltl", "<cmd>CBllline1<cr>", desc = "Center" },
    { "<leader>cltr", "<cmd>CBlrline1<cr>", desc = "Center" },
})

-- ───────────────────────────────── LSP ─────────────────────────────────
vim.api.nvim_create_autocmd("LSPAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        wk.add({
            { "gD", function() vim.lsp.buf.definition() end, desc = "Declarations" },
            { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
            { "gT", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },
            { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Type Definitions" },
            { "<leader>i", function() vim.lsp.buf.hover() end, desc = "Hover" },
            { "<leader>a", group = "code actions" },
            { "<leader>aa", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
            { "<leader>ar", function() vim.lsp.buf.rename() end, desc = "Rename" },
            { "<leader>af", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
            { "<leader>d", group = "diagnostics" },
            { "<leader>dd", function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
            { "<leader>dn", function() vim.diagnostic.goto_next() end, desc = "Next"},
            { "<leader>dp", function() vim.diagnostic.goto_prev() end, desc = "Previous" },
        }, { buffer = ev.buf })
    end,
})

-- ────────────────────────────── Git Signs ──────────────────────────────
local gitsigns = require("gitsigns")
gitsigns.setup({
    on_attach = function()
        wk.add({
            { "<leader>g", group = "git" },
            { "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", desc = "Show Signs" },
        })
        wk.add({
            mode = { "n" },
            {"<leader>gh", group = "hunk" },
            { "<leader>ghr", function() gitsigns.reset_hunk() end, desc = "Reset" },
            { "<leader>ghs", function() gitsigns.stage_hunk() end, desc = "Stage" },
            { "<leader>ghR", function() gitsigns.reset_buffer() end, desc = "Reset Buffer" },
            { "<leader>ghS", function() gitsigns.stage_buffer() end, desc = "Stage Buffer" },
            { "<leader>ghu", function() gitsigns.undo_stage_hunk() end, desc = "Undo Stage" },
            { "<leader>ghp", function() gitsigns.preview_hunk() end, desc = "Preview Hunk" },
        })
    end,
})
