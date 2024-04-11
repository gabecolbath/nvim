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
    ["<C-h>"] = { "<C-w>h", "Move To Left Window" },
    ["<C-j>"] = { "<C-w>j", "Move To Down Window" },
    ["<C-k>"] = { "<C-w>k", "Move To Up Window" },
    ["<C-l>"] = { "<C-w>l", "Move To Right Window" },
})

-- Save/Quit ------------------------------------------------------------------
map.register({
    ["<leader>w"] = {
        name = "Save",
        ["w"] = { ":w<cr>", "Save" },
        ["q"] = { ":wq<cr>", "Save and Quit" },
        ["f"] = { ":w!<cr>", "Force Save" },
    },
    ["<leader>q"] = {
        name = "Quit",
        ["q"] = { ":q<cr>", "Quit" },
        ["f"] = { ":q!<cr>", "Force Quit" },
    },
})

-- Scrolling ------------------------------------------------------------------
map.register({
    ["<C-d>"] = { "<C-d>zz", "Scroll Down" },
    ["<C-u>"] = { "<C-u>zz", "Scroll Up" },
})

-- LSP ------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        map.register({
            ["gD"] = { function() vim.lsp.buf.declaration() end, "Go to Declaration" },
            ["gi"] = { ":Telescope lsp_implementations<cr>", "Show Implementations" },
            ["gr"] = { ":TroubleToggle lsp_references", "Show References" },
            ["gd"] = {
                name = "Definitions",
                ["d"] = { ":Telescope lsp_definitions<cr>", "Show Definitions" },
                ["t"] = { ":Telescope lsp_type_definitions<cr>", "Show Type Definitions" },
            },
            ["<leader>i"] = {
                name = "Info",
                ["i"] = { function() vim.lsp.buf.hover() end, "Hover" },
                ["f"] = { function() vim.lsp.buf.signature_help() end, "Signature Help" },
            },
            ["<leader>W"] = {
                name = "Workspace",
                ["a"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add Folder" },
                ["r"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove Folder" },
                ["l"] = { function() require("main-config.utils.list-workspace-popup").open_popup() end, "List Workspaces" },
            },
            ["<leader>a"] = {
                name = "Code Actions",
                ["a"] = { ":CodeActionMenu<cr>", "Code Actions" },
                ["r"] = { function() vim.lsp.buf.rename() end, "Rename" },
                ["f"] = { function() vim.lsp.buf.format({ async = true }) end, "Format" },
            },
            ["<leader>l"] = {
                name = "Lsp",
                ["l"] = { ":LspInfo<cr>", "Info" },
                ["r"] = { ":LspRestart<cr>", "Restart" },
            },
            ["<leader>d"] = {
                name = "Diagnostics",
                ["d"] = { function() vim.diagnostic.open_float() end, "Show Diagnostics" },
                ["n"] = { function() vim.diagnostic.goto_next() end, "Next Diagnostic" },
                ["p"] = { function() vim.diagnostic.goto_prev() end, "Previous Diagnostic" },
            },
        }, {
            buffer = ev.buf,
        })
    end,
})

-- Lazy -----------------------------------------------------------------------
map.register({
    ["L"] = { ":Lazy<cr>", "Lazy" },
}, {
    prefix = "<leader>",
})

-- Oil ------------------------------------------------------------------------
map.register({
    ["e"] = { ":Oil --float<cr>", "File Explorer" },
}, {
    prefix = "<leader>",
})

-- Telescope ------------------------------------------------------------------
map.register({
    ["f"] = {
        name = "Telescope",
        ["p"] = { ":Telescope<cr>", "Pickers" },
        ["f"] = { ":Telescope find_files<cr>", "Files" },
        ["g"] = { ":Telescope live_grep<cr>", "Live Grep" },
        ["b"] = { ":Telescope buffers<cr>", "Buffers" },
        ["h"] = { ":Telescope help_tags<cr>", "Help Tags" },
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
        ["h"] = { function() harpoon_ui.toggle_quick_menu() end, "Menu" },
        ["a"] = { function() harpoon_mark.add_file() end, "Add File" },
    },
}, {
    prefix = "<leader>",
})

-- Code Action ----------------------------------------------------------------
map.register({
    ["a"] = {
        name = "Code Actions",
        ["a"] = { ":CodeActionMenu<cr>", "Code Actions" }
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
        ["s"] = { function() spectre.toggle() end, "Menu" },
        ["w"] = { function() spectre.open_visual({ select_word = true }) end, "Word" },
        ["f"] = { function() spectre.open_file_search() end, "File" }
    },
}, {
    prefix = "<leader>"
})
map.register({
    ["s"] = {
        name = "Spectre",
        ["s"] = { function() spectre.open_visual() end, "Selection" },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})

-- Mason ----------------------------------------------------------------------
map.register({
    ["<leader>M"] = { ":Mason<cr>", "Mason" },
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
        ["x"] = { ":TroubleToggle<cr>", "Diagnostics" },
        ["w"] = { ":TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
        ["d"] = { ":TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
        ["q"] = { ":TroubleToggle quickfix<cr>", "Quickfix" },
        ["l"] = { ":TroubleToggle loclist<cr>", "Loclist" },
    },
})

-- Zen Mode -------------------------------------------------------------------
map.register({
    ["<leader>z"] = { ":ZenMode<cr>", "Zen Mode" },
})
