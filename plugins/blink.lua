return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = {
                ['<C-j>'] = { "select_next", "fallback" },
                ['<C-k>'] = { "select_prev", "fallback" },
                ['<C-l>'] = { "select_and_accept", "fallback" },
            },
            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },
            completion = {
                menu = {
                    border = "single",
                    scrollbar = false,
                },
                documentation = {
                    window = {
                        border = "single",
                    },
                },
            },
        },
    },
}
