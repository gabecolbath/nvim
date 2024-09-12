--  888    d8P
--  888   d8P
--  888  d8P
--  888d88K      .d88b.  888  888 88888b.d88b.   8888b.  88888b.  .d8888b
--  8888888b    d8P  Y8b 888  888 888 "888 "88b     "88b 888 "88b 88K
--  888  Y88b   88888888 888  888 888  888  888 .d888888 888  888 "Y8888b.
--  888   Y88b  Y8b.     Y88b 888 888  888  888 888  888 888 d88P      X88
--  888    Y88b  "Y8888   "Y88888 888  888  888 "Y888888 88888P"   88888P'
--                            888                        888
--                       Y8b d88P                        888
--                        "Y88P"                         888

local map = require("which-key")

local default_opts_n = {
    mode = "n",
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
    expr = false,
}

local default_opts_v = {
    mode ="v",
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
    expr = false,
}

-- Window Navigation ----------------------------------------------------------
map.register({
    ["<C-h>"] = { "<C-w>h", desc = "Move To Left Window" },
    ["<C-j>"] = { "<C-w>j", desc = "Move To Down Window" },
    ["<C-k>"] = { "<C-w>k", desc = "Move To Up Window" },
    ["<C-l>"] = { "<C-w>l", desc = "Move To Right Window" },
})

-- Scrolling ------------------------------------------------------------------
map.register({
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll Down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll Up" },
})

-- LSP ------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        map.register({
            ["gD"] = { function() vim.lsp.buf.declaration() end, desc = "Go to Declaration" },
            ["gi"] = { ":Telescope lsp_implementations<cr>", desc = "Show Implementations" },
            ["gr"] = { ":TroubleToggle lsp_references", desc = "Show References" },
            ["gd"] = {
                name = "Definitions",
                ["d"] = { ":Telescope lsp_definitions<cr>", desc = "Show Definitions" },
                ["t"] = { ":Telescope lsp_type_definitions<cr>", desc = "Show Type Definitions" },
            },
            ["<leader>i"] = {
                name = "Info",
                ["i"] = { function() vim.lsp.buf.hover() end, desc = "Hover" },
                ["f"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
            },
            ["<leader>W"] = {
                name = "Workspace",
                ["a"] = { function() vim.lsp.buf.add_workspace_folder() end, desc = "Add Folder" },
                ["r"] = { function() vim.lsp.buf.remove_workspace_folder() end, desc = "Remove Folder" },
                ["l"] = { function() require("main-config.utils.list-workspace-popup").open_popup() end, desc = "List Workspaces" },
            },
            ["<leader>a"] = {
                name = "Code Actions",
                ["a"] = { ":CodeActionMenu<cr>", desc = "Code Actions" },
                ["r"] = { function() vim.lsp.buf.rename() end, desc = "Rename" },
                ["f"] = { function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
            },
            ["<leader>l"] = {
                name = "Lsp",
                ["l"] = { ":LspInfo<cr>", desc = "Info" },
                ["r"] = { ":LspRestart<cr>", desc = "Restart" },
            },
            ["<leader>d"] = {
                name = "Diagnostics",
                ["d"] = { function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
                ["n"] = { function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
                ["p"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" },
            },
        }, {
            buffer = ev.buf,
        })
    end,
})

-- Lazy -----------------------------------------------------------------------
map.register({
    ["L"] = { ":Lazy<cr>", desc = "Lazy" },
}, {
    prefix = "<leader>",
})

-- Oil ------------------------------------------------------------------------
map.register({
    ["e"] = { ":Oil --float<cr>", desc = "File Explorer" },
}, {
    prefix = "<leader>",
})

-- Telescope ------------------------------------------------------------------
map.register({
    ["f"] = {
        name = "Telescope",
        ["p"] = { ":Telescope<cr>", desc = "Pickers" },
        ["f"] = { ":Telescope find_files<cr>", desc = "Files" },
        ["g"] = { ":Telescope live_grep<cr>", desc = "Live Grep" },
        ["b"] = { ":Telescope buffers<cr>", desc = "Buffers" },
        ["h"] = { ":Telescope help_tags<cr>", desc = "Help Tags" },
    },
}, {
    prefix = "<leader>",
})

-- Harpoon --------------------------------------------------------------------
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
map.register({
    ["h"] = {
        name = "Harpoon",
        ["h"] = { function() harpoon_ui.toggle_quick_menu() end, desc = "Menu" },
        ["a"] = { function() harpoon_mark.add_file() end, desc = "Add File" },
    },
}, {
    prefix = "<leader>",
})

-- Code Action ----------------------------------------------------------------
map.register({
    ["a"] = {
        name = "Code Actions",
        ["a"] = { ":CodeActionMenu<cr>", desc = "Code Actions" }
    },
}, {
    prefix = "<leader>",
})

-- Comment --------------------------------------------------------------------
local comment = require("Comment")
comment.setup({
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    opleader = {
        line = "gc",
        block = "gb",
    },
    extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
    },
    mappings = {
        basic = true,
        extra = true,
    },
})

-- Spectre --------------------------------------------------------------------
local spectre = require("spectre")
map.register({
    ["s"] = {
        name = "Spectre",
        ["s"] = { function() spectre.toggle() end, desc = "Menu" },
        ["w"] = { function() spectre.open_visual({ select_word = true }) end, desc = "Word" },
        ["f"] = { function() spectre.open_file_search() end, desc = "File" }
    },
}, {
    prefix = "<leader>"
})
map.register({
    ["s"] = {
        name = "Spectre",
        ["s"] = { function() spectre.open_visual() end, desc = "Selection" },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})

-- Mason ----------------------------------------------------------------------
map.register({
    ["<leader>M"] = { ":Mason<cr>", desc = "Mason" },
})

-- CMP ------------------------------------------------------------------------
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
})

-- Trouble --------------------------------------------------------------------
map.register({
    ["<leader>x"] = {
        name = "Trouble",
        ["x"] = { ":TroubleToggle<cr>", desc = "Diagnostics" },
        ["w"] = { ":TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
        ["d"] = { ":TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
        ["q"] = { ":TroubleToggle quickfix<cr>", desc = "Quickfix" },
        ["l"] = { ":TroubleToggle loclist<cr>", desc = "Loclist" },
    },
})

-- Zen Mode -------------------------------------------------------------------
map.register({
    ["<leader>z"] = { ":ZenMode<cr>", desc = "Zen Mode" },
})
