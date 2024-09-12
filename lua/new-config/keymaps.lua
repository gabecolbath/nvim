local wk = require("which-key")

-- Lazy
wk.add({
    { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
})

-- Mason
wk.add({
    { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
})

-- Messages
wk.add({
    { "<leader>m", "<cmd>messages<cr>", desc = "Messages" },
})

wk.add({
    { "<leader>l", group = "lsp" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart" },
})

-- Telescope
wk.add({
    { "<leader>f", group = "file" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
})

-- Oil
wk.add({
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "File Explorer" },
})

-- CMP
--      See cmp configuration
